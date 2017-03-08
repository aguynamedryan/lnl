-- The 10 minute crash course in SQL
--
-- ## SELECT == projection
--
-- SELECT is the same as "project" in relational algebra.
-- Use SELECT to determine what columns of information you want in the result of your query
SELECT person_id, condition_source_value
FROM condition_occurrence
;

-- ## FROM == selection
--
-- FROM dictates what table (relation) we should pull rows from
SELECT *
FROM person
;

-- ## WHERE == selection with predicate applied
--
-- WHERE takes a predicates (think statement or statements that return true or false)
-- and returns only those rows (tuples) for which the predicate is true
SELECT person_id, condition_source_value, condition_start_date, condition_end_date
FROM condition_occurrence
WHERE person_id > 50
AND condition_source_value IN ('412', '410.00')
;

-- ## JOIN == merging two or more tables together to find relationships
--
-- JOIN operations are where the "relate" in "relational databases" comes into play.
-- JOINs merge rows from multiple tables to help explore the relationship between data
SELECT p.race_concept_id, c.condition_source_value
FROM condition_occurrence c
JOIN person p ON (p.person_id = c.person_id)
WHERE c.condition_source_value = '412'
;

-- ## Aggregate == roll up data
--
-- SQL has a set of functions that operator over the rows of a query and summarizes the results.
-- These are the kinds of functions business intelligence programs use quite often.
--
-- We can find the SUM of a column, if we're looking for costs or earnings
-- We can use AVERAGE or COUNT to find number of visitors to a web site

SELECT count(1)
FROM condition_occurrence
WHERE condition_source_value = '412'
;

-- ## GROUP
--
-- Aggregate operations can group the results by one or more columns to give
-- back multiple sets of rows.
--
-- So if we want to see how many times each patient was diagnosed with '410.y' or '411.y'
-- we'd use this query, which includes some "wildcard" characters
SELECT person_id, count(1)
FROM condition_occurrence
WHERE condition_source_value LIKE '41_.%'
GROUP BY person_id
ORDER BY count(1) desc
;

-- ## Put it all together
--
-- Now let us see if a certain gender has a disproportionate percentage of heart attacks.
--
-- We'll start by making a set of queries that will setup all the data we need
--
-- First, we'll need a denominator for each gender
SELECT gender_concept_id, count(1) AS gender_total
FROM person
GROUP BY gender_concept_id
;

-- Next we'll need to find the names for each gender_concept_id in the person table
SELECT con.concept_name AS gender_name, p.gender_concept_id AS gender_concept_id
FROM "vocabulary"."concept" con
JOIN person p ON (p.gender_concept_id = con.concept_id)
GROUP BY p.gender_concept_id, con.concept_name
;

-- Then we'll want to find all people who've had a heart attack event
SELECT person_id
FROM condition_occurrence
WHERE condition_source_value LIKE '41_.%'
;

-- Now we'll find those people and group them by gender_concept_id
--
-- We need the list of person_ids with heart attack for this next query
-- so we'll use a Common Table Expression (CTE) to package up the previous query
-- as a relation we can pull from
WITH people_with_heart_attack AS (
  SELECT person_id
  FROM condition_occurrence
  WHERE condition_source_value LIKE '41_.%'
)
SELECT gender_concept_id, count(1) AS gender_count
FROM person
WHERE person_id IN (
  SELECT person_id
  FROM people_with_heart_attack
)
GROUP BY gender_concept_id
;

-- Now, we'll use a lot of CTEs to represent each of the queries above
-- so we can succinctly? represent each part of the query as its own relation
-- and then join together the necessary relations to show the percentages
-- we're interested in
WITH totals_per_gender AS (
  SELECT gender_concept_id, count(1) AS gender_total
  FROM person
  GROUP BY gender_concept_id
),
gender_by_name AS (
  SELECT con.concept_name AS gender_name, p.gender_concept_id AS gender_concept_id
  FROM "vocabulary"."concept" con
  JOIN person p ON (p.gender_concept_id = con.concept_id)
  GROUP BY p.gender_concept_id, con.concept_name
),
people_with_heart_attack AS (
  SELECT person_id
  FROM condition_occurrence
  WHERE condition_source_value LIKE '41_.%'
),
gender_counts AS (
  SELECT gender_concept_id, count(1) AS gender_count
  FROM person
  WHERE person_id IN (
    SELECT person_id
    FROM people_with_heart_attack
  )
  GROUP BY gender_concept_id
)
SELECT gbn.gender_name, (gc.gender_count * 100.0) / tpg.gender_total as percent_with_heart_attack_event
FROM gender_counts gc
JOIN totals_per_gender tpg USING (gender_concept_id)
JOIN gender_by_name gbn ON (gbn.gender_concept_id = gc.gender_concept_id)
;
