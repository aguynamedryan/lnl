# Example 1:  SQL Examples




We'll be using the `condition_occurrence` and `person` tables from the `synpuf_250` database
to illustrate a few SQL basics

#### Query 1.1



```sql
SELECT
    *
FROM
    person;
```

Found 250 results.  Displaying first 10.

| person_id | gender_concept_id | year_of_birth | month_of_birth | day_of_birth | race_concept_id | ethnicity_concept_id | location_id | provider_id | care_site_id | person_source_value | gender_source_value | race_source_value | ethnicity_source_value |
| ---------------: | -------------------------: | ---------------------: | --------------------: | -----------------: | -----------------------: | -------------------------: | :------------------ | :------------------ | :------------------- | :----------------------------------------- | :------------------------------- | :------------------------------------------------ | :----------------------------- |
| 1 | 8507 | 1,923 | 5 | 1 | 8527 | 0 |  |  |  | 00013D2EFD8E45D1 | MALE | White |  |
| 2 | 8507 | 1,943 | 1 | 1 | 8527 | 0 |  |  |  | 00016F745862898F | MALE | White |  |
| 3 | 8532 | 1,936 | 9 | 1 | 8527 | 0 |  |  |  | 0001FDD721E223DC | FEMALE | White |  |
| 4 | 8507 | 1,941 | 6 | 1 | 8522 | 0 |  |  |  | 00021CA6FF03E670 | MALE | Other Race |  |
| 5 | 8507 | 1,936 | 8 | 1 | 8527 | 0 |  |  |  | 00024B3D2352D2D0 | MALE | White |  |
| 6 | 8507 | 1,943 | 10 | 1 | 8516 | 0 |  |  |  | 0002DAE1C81CC70D | MALE | Black or African American |  |
| 7 | 8507 | 1,922 | 7 | 1 | 8527 | 0 |  |  |  | 0002F28CE057345B | MALE | White |  |
| 8 | 8507 | 1,935 | 9 | 1 | 8527 | 0 |  |  |  | 000308435E3E5B76 | MALE | White |  |
| 9 | 8532 | 1,976 | 9 | 1 | 8527 | 0 |  |  |  | 000345A39D4157C9 | FEMALE | White |  |
| 10 | 8532 | 1,938 | 10 | 1 | 8516 | 0 |  |  |  | 00036A21B65B0206 | FEMALE | Black or African American |  |
***




#### Query 1.2



```sql
SELECT
    *
FROM
    condition_occurrence;
```

Found 34,043 results.  Displaying first 10.

| condition_occurrence_id | person_id | condition_concept_id | condition_start_date | condition_end_date | condition_type_concept_id | stop_reason | associated_provider_id | visit_occurrence_id | condition_source_value |
| -----------------------------: | --------------: | -------------------------------: | :--------------------------------------------------------------------------- | :------------------------------------------------------------------------- | -------------------------------------: | :------------------ | ---------------------------: | ------------------------: | :---------------------------------- |
| 1 | 1 | 135360 | 2010-03-12 | 2010-03-13 | 38000200 | 0 | 0 | 1 | 780.2 |
| 2 | 1 | 192450 | 2010-03-12 | 2010-03-13 | 38000201 | 0 | 0 | 1 | 788.20 |
| 3 | 1 | 4161977 | 2010-03-12 | 2010-03-13 | 38000202 | 0 | 0 | 1 | V45.01 |
| 4 | 1 | 319835 | 2010-03-12 | 2010-03-13 | 38000203 | 0 | 0 | 1 | 428.0 |
| 5 | 1 | 4096215 | 2010-03-12 | 2010-03-13 | 38000204 | 0 | 0 | 1 | 272.0 |
| 6 | 1 | 320128 | 2010-03-12 | 2010-03-13 | 38000205 | 0 | 0 | 1 | 401.9 |
| 7 | 1 | 4050572 | 2010-03-12 | 2010-03-13 | 38000206 | 0 | 0 | 1 | V45.02 |
| 8 | 1 | 80502 | 2010-03-12 | 2010-03-13 | 38000207 | 0 | 0 | 1 | 733.00 |
| 9 | 1 | 437469 | 2010-03-12 | 2010-03-13 | 38000208 | 0 | 0 | 1 | E933.0 |
| 10 | 1 | 4253223 | 2008-09-04 | 2008-09-04 | 38000215 | 0 | 0 | 2 | V58.41 |
***








# Example 2:  The 10 minute crash course in SQL




## SELECT == projection


SELECT is the same as "project" in relational algebra.
Use SELECT to determine what columns of information you want in the result of your query

#### Query 2.1



```sql
SELECT
    person_id,
    condition_source_value
FROM
    condition_occurrence;
```

Found 34,043 results.  Displaying first 10.

| person_id | condition_source_value |
| --------------: | :---------------------------------- |
| 1 | 780.2 |
| 1 | 788.20 |
| 1 | V45.01 |
| 1 | 428.0 |
| 1 | 272.0 |
| 1 | 401.9 |
| 1 | V45.02 |
| 1 | 733.00 |
| 1 | E933.0 |
| 1 | V58.41 |
***


## FROM == selection


FROM dictates what table (relation) we should pull rows from

#### Query 2.2



```sql
SELECT
    *
FROM
    person;
```

Found 250 results.  Displaying first 10.

| person_id | gender_concept_id | year_of_birth | month_of_birth | day_of_birth | race_concept_id | ethnicity_concept_id | location_id | provider_id | care_site_id | person_source_value | gender_source_value | race_source_value | ethnicity_source_value |
| ---------------: | -------------------------: | ---------------------: | --------------------: | -----------------: | -----------------------: | -------------------------: | :------------------ | :------------------ | :------------------- | :----------------------------------------- | :------------------------------- | :------------------------------------------------ | :----------------------------- |
| 1 | 8507 | 1,923 | 5 | 1 | 8527 | 0 |  |  |  | 00013D2EFD8E45D1 | MALE | White |  |
| 2 | 8507 | 1,943 | 1 | 1 | 8527 | 0 |  |  |  | 00016F745862898F | MALE | White |  |
| 3 | 8532 | 1,936 | 9 | 1 | 8527 | 0 |  |  |  | 0001FDD721E223DC | FEMALE | White |  |
| 4 | 8507 | 1,941 | 6 | 1 | 8522 | 0 |  |  |  | 00021CA6FF03E670 | MALE | Other Race |  |
| 5 | 8507 | 1,936 | 8 | 1 | 8527 | 0 |  |  |  | 00024B3D2352D2D0 | MALE | White |  |
| 6 | 8507 | 1,943 | 10 | 1 | 8516 | 0 |  |  |  | 0002DAE1C81CC70D | MALE | Black or African American |  |
| 7 | 8507 | 1,922 | 7 | 1 | 8527 | 0 |  |  |  | 0002F28CE057345B | MALE | White |  |
| 8 | 8507 | 1,935 | 9 | 1 | 8527 | 0 |  |  |  | 000308435E3E5B76 | MALE | White |  |
| 9 | 8532 | 1,976 | 9 | 1 | 8527 | 0 |  |  |  | 000345A39D4157C9 | FEMALE | White |  |
| 10 | 8532 | 1,938 | 10 | 1 | 8516 | 0 |  |  |  | 00036A21B65B0206 | FEMALE | Black or African American |  |
***


## WHERE == selection with predicate applied


WHERE takes a predicates (think statement or statements that return true or false)
and returns only those rows (tuples) for which the predicate is true

#### Query 2.3



```sql
SELECT
    person_id,
    condition_source_value,
    condition_start_date,
    condition_end_date
FROM
    condition_occurrence
WHERE
    person_id > 50
    AND condition_source_value IN ('412', '410.00');
```

Found 47 results.  Displaying first 10.

| person_id | condition_source_value | condition_start_date | condition_end_date |
| ---------------: | :------------------------------- | :--------------------------------------------------------------------------- | :------------------------------------------------------------------------- |
| 53 | 412 | 2008-06-05 | 2008-06-05 |
| 59 | 412 | 2009-07-19 | 2009-07-22 |
| 64 | 412 | 2009-07-25 | 2009-07-25 |
| 71 | 412 | 2008-11-16 | 2008-11-16 |
| 75 | 412 | 2010-10-06 | 2010-10-06 |
| 79 | 412 | 2009-01-28 | 2009-01-30 |
| 86 | 412 | 2009-01-03 | 2009-01-09 |
| 86 | 412 | 2009-05-30 | 2009-05-30 |
| 88 | 412 | 2010-05-26 | 2010-05-26 |
| 91 | 412 | 2009-11-08 | 2009-11-08 |
***


## JOIN == merging two or more tables together to find relationships


JOIN operations are where the "relate" in "relational databases" comes into play.
JOINs merge rows from multiple tables to help explore the relationship between data

#### Query 2.4



```sql
SELECT
    p.race_concept_id,
    c.condition_source_value
FROM
    condition_occurrence c
    JOIN person p ON (p.person_id = c.person_id)
WHERE
    c.condition_source_value = '412';
```

Found 50 results.  Displaying first 10.

| race_concept_id | condition_source_value |
| -----------------------: | :------------------------------- |
| 8516 | 412 |
| 8516 | 412 |
| 8527 | 412 |
| 8527 | 412 |
| 8527 | 412 |
| 8527 | 412 |
| 8527 | 412 |
| 8527 | 412 |
| 8527 | 412 |
| 8527 | 412 |
***


## Aggregate == roll up data


SQL has a set of functions that operator over the rows of a query and summarizes the results.
These are the kinds of functions business intelligence programs use quite often.


We can find the SUM of a column, if we're looking for costs or earnings
We can use AVERAGE or COUNT to find number of visitors to a web site

#### Query 2.5



```sql
SELECT
    count (1)
FROM
    condition_occurrence
WHERE
    condition_source_value = '412';
```

Found 1 results.

| count |
| -----------: |
| 50 |
***


## GROUP


Aggregate operations can group the results by one or more columns to give
back multiple sets of rows.


So if we want to see how many times each patient was diagnosed with '410.y' or '411.y'
we'd use this query, which includes some "wildcard" characters

#### Query 2.6



```sql
SELECT
    person_id,
    count (1)
FROM
    condition_occurrence
WHERE
    condition_source_value LIKE '41_.%'
GROUP BY
    person_id
ORDER BY
    count (1)
    DESC;
```

Found 180 results.  Displaying first 10.

| person_id | count |
| ----------------: | -----------: |
| 239 | 17 |
| 93 | 16 |
| 14 | 16 |
| 106 | 14 |
| 255 | 14 |
| 212 | 14 |
| 86 | 14 |
| 107 | 13 |
| 92 | 12 |
| 173 | 11 |
***


## Put it all together


Now let us see if a certain gender has a disproportionate percentage of heart attacks.


We'll start by making a set of queries that will setup all the data we need


First, we'll need a denominator for each gender

#### Query 2.7



```sql
SELECT
    gender_concept_id,
    count (1) AS gender_total
FROM
    person
GROUP BY
    gender_concept_id;
```

Found 2 results.

| gender_concept_id | gender_total |
| -------------------------: | -------------------: |
| 8507 | 126 |
| 8532 | 124 |
***


Next we'll need to find the names for each gender_concept_id in the person table

#### Query 2.8



```sql
SELECT
    con.concept_name AS gender_name,
    p.gender_concept_id AS gender_concept_id
FROM
    "vocabulary"."concept" con
    JOIN person p ON (p.gender_concept_id = con.concept_id)
GROUP BY
    p.gender_concept_id,
    con.concept_name;
```

Found 2 results.

| gender_name | gender_concept_id |
| :----------------------- | -------------------------: |
| FEMALE | 8532 |
| MALE | 8507 |
***


Then we'll want to find all people who've had a heart attack event

#### Query 2.9



```sql
SELECT
    person_id
FROM
    condition_occurrence
WHERE
    condition_source_value LIKE '41_.%';
```

Found 852 results.  Displaying first 10.

| person_id |
| --------------: |
| 2 |
| 2 |
| 2 |
| 4 |
| 5 |
| 6 |
| 7 |
| 7 |
| 7 |
| 7 |
***


Now we'll find those people and group them by gender_concept_id


We need the list of person_ids with heart attack for this next query
so we'll use a Common Table Expression (CTE) to package up the previous query
as a relation we can pull from

#### Query 2.10



```sql
WITH people_with_heart_attack AS (
    SELECT
        person_id
    FROM
        condition_occurrence
    WHERE
        condition_source_value LIKE '41_.%')
SELECT
    gender_concept_id,
    count (1) AS gender_count
FROM
    person
WHERE
    person_id IN (
        SELECT
            person_id
        FROM
            people_with_heart_attack)
GROUP BY
    gender_concept_id;
```

Found 2 results.

| gender_concept_id | gender_count |
| -------------------------: | ------------------: |
| 8507 | 89 |
| 8532 | 91 |
***


Now, we'll use a lot of CTEs to represent each of the queries above
so we can succinctly? represent each part of the query as its own relation
and then join together the necessary relations to show the percentages
we're interested in

#### Query 2.11



```sql
WITH totals_per_gender AS (
    SELECT
        gender_concept_id,
        count (1) AS gender_total
    FROM
        person
    GROUP BY
        gender_concept_id),
gender_by_name AS (
    SELECT
        con.concept_name AS gender_name,
        p.gender_concept_id AS gender_concept_id
    FROM
        "vocabulary"."concept" con
        JOIN person p ON (p.gender_concept_id = con.concept_id)
    GROUP BY
        p.gender_concept_id,
        con.concept_name),
people_with_heart_attack AS (
    SELECT
        person_id
    FROM
        condition_occurrence
    WHERE
        condition_source_value LIKE '41_.%'), gender_counts AS (
    SELECT
        gender_concept_id,
        count (1) AS gender_count
    FROM
        person
    WHERE
        person_id IN (
            SELECT
                person_id
            FROM
                people_with_heart_attack)
    GROUP BY
        gender_concept_id)
SELECT
    gbn.gender_name,
    (gc.gender_count * 100.0)
    / tpg.gender_total AS percent_with_heart_attack_event
FROM
    gender_counts gc
    JOIN totals_per_gender tpg
    USING (gender_concept_id)
    JOIN gender_by_name gbn ON (gbn.gender_concept_id = gc.gender_concept_id);
```

Found 2 results.

| gender_name | percent_with_heart_attack_event |
| :----------------------- | ----------------------------------------------------------------------------------------------: |
| MALE | 70.63 |
| FEMALE | 73.39 |
***








