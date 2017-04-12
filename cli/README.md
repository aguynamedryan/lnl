---
revealOptions:
  slideNumber: true
---

# CLI or Die!

#### a.k.a. Data Munging is Even Worse Than it Sounds
#### a.k.a. Why Text is King
#### a.k.a. Why Ryan is Allergic to Microsoft

---

# Data Munging Sounds Yucky

Because Data Munging Is Yucky

- http://www.dictionary.com/browse/munge
- http://www.dictionary.com/browse/mung

Yikes!  Sounds (and is) awful!

---

# CLI - Command Line Interface

The CLI is like a workbench for data processing.
![DATA WIZARD!!!!!](images/data_wizards_workbench.png)

---

# CLI - Command Line Interface

In the beginning there was the command line interface

![AND HE THOUGHT IT GOOD](images/dawn_of_cli.png)

---

# CLI - Command Line Interface

Nah, actually it was punch cards and paper tapes

![BEHOLD MINE PROGRAM](https://upload.wikimedia.org/wikipedia/commons/4/4c/Blue-punch-card-front-horiz.png)

---

# CLI - Command Line Interface

Then it was 6 switches on the front of a monitor

![BEHOLD THE FUTURE!](http://blog.smartbear.com/wp-content/uploads/2013/06/altair-8800-microcomputer.png)

---

# CLI - Command Line Interface

*Then* it was the command line interface

![SPOILER: IT DOESN'T GET BETTER THAN THIS](https://c2.staticflickr.com/8/7038/7082108087_d097072d35_z.jpg)

---

# CLI - Command Line Interface

And there is no better CLI than Unix\*

\* as far as I know

---

# Unix Philosophy

The power of the CLI originates from the Unix philosophy.

- [from Doug McIlroy](http://emulator.pdp-11.org.ru/misc/1978.07_-_Bell_System_Technical_Journal.pdf)

---

# Unix Philosophy - #1

- **Make each program do one thing well.**
  - To do a new job, build afresh rather than complicate old programs by adding new "features".

---

# Unix Philosophy - #2

- **Expect the output of every program to become the input to another, as yet unknown, program**
  - Don't clutter output with extraneous information
  - Avoid stringently columnar or binary input formats
  - Don't insist on interactive input

---

# Unix Philosophy - #3

Design and build software, even operating systems, to be tried early, ideally within weeks. Don't hesitate to throw away the clumsy parts and rebuild them.

---

# Unix Philosophy - #4

Use tools in preference to unskilled help to lighten a programming task, even if you have to detour to build the tools and expect to throw some of them out after you've finished using them.

---

# Unix Philosophy - #5 (Corollary 1)

Whenever possible, make a pun

---

# Unix Philosophy - #6 (Corollary 2)

If you can't do #5, make the command cryptically short

---

# Ryan 💛 #4


- The basic idea is to keep a human out of the loop as much as possible
- If the task is repetitive, and you can do it in the command line, you can automate the entire thing
- Because of items 1 and 2, the Unix CLI is the best place I can think of to develop _reproducible_ workflows

---

# Summary of #4

*Go away or I will replace you with a very small shell script!*

![Bastard Operator From Hell](images/bofh.png)

---

# #1 - There's a Command for That

Linux is rife with commands for processing data

| command | primary purpose |
| ------- | --------------- |
| grep, ag | find a word in files |
| head, tail | see the start/end of files |
| cat | dump contents of file
| sed | Stream EDitor  (also, Sam Ethan Duryea)|
| wc | word count |
| bc | basic calculator |
| dos2unix | fix line endings |
| xargs | execute a command on many files |
| find | find files matching a pattern |

---

# Demos

I wrote a script that regenerates these next slides :-)

---

# `grep`

```demo
grep xargs README.md
grep -l xargs *
```

---

# `head` or `tail`?

```demo
head -n 5 processor.rb
tail -n 5 processor.rb
```

---

# `sed` it straight

```demo
cat data.csv
sed "s/,/:/g" data.csv
```

---

# `wc`, doesn't mean water closet!

```demo
wc -l README.md
```

---

# `bc`, not before christ

```demo
cat addition.txt
bc addition.txt
```

---

# `find` it

```demo
find . -name "*.png"
find . -type f -a \! \( -name ".??*" \)
```

---

# Line Endings Will be My Ending

- Unix uses LF
- Mac OS used to use CRLF
- Windows uses CR

```bash
dos2unix file1.txt
```

---

# Standard Output, Input, Error

When you see the results of each command, you're seeing what that command has sent to "standard output"

By default, standard output is written back into your terminal.

Also, by default, standard input is read from your keyboard.

---

# Redirection

But you can tell ANY Unix program to send its output some where else, like to a new file.

```demo
sed "s/,/\|/g" data.csv > data.psv
cat data.psv
```

---

# In Unix, Everything is a File

Reading and writing to devices attached to your computer is done the same way a program reads from a keyboard or writes to a file

```demo
head -n 2 < /dev/random # Make standard input read from /dev/random
echo "straight to the abyss" > /dev/null # Write standard output to the trash
```

---

# Prepare Yourselves...

So:

- Commands read from your keyboard, but can be tricked into reading from files
  - This is done by changing the source for Standard Input
- Commands write to your console, but can be tricked into writing to files
  - This is done by changing the destination for Standard Output

---

# ...For a Mind Explosion!

We can implement Unix Philosophy #2 if we make the output of one command become the input of another.

---

# Piping Hot!

Unix has the "pipe" operator: `|`

It says "feed the standard output from the command(s) on the left directly into standard input of the command on the right"

```demo
cat README.md | grep demo | wc -l # How many demo blocks are there in README.md
```

---

# grep fixed

```demo
grep xargs README.md | grep -v grep
```

---

# Sum a Column of Numbers

```demo
head data.csv
wc -l data.csv
tail -n +1 data.csv | cut -d"," -f 1 | paste -sd+ - | bc
```

---

# Pipes are POWERFUL

You can build intricate workflows using pipes, passing, manipulating, and filtering text from one command to another.

```bash
ls *.zip | xargs -n 1 unzip -n -P 2345671asdf
```

This unzipped 59 data files, each taking 20-30 minutes.  Michelle had been doing this manually over the course of days.  In a few hours, this script finished the rest.

---

# Replicating an Entire Database

Trivial with pipes

```bash
pg_dump -n vocabulary -n public -n mdcr_syn_samp postgres://ryan:r@helios.jsaw.io/jigsaw_with_lots_of_data | psql jigsaw_omop
```

---

# Reproducible Workflows

Again, if I can do something in a command line, there's a 99% chance I can automate that process.

Here are some example scripts that I've written over the last couple years.

---

# Create 250 Patient SynPUF Sample

First create /tmp/ids.txt, the least of 250 patient ids

```bash
csvcut -c person_id person.csv | tail -n +2 > /tmp/ids.txt
```

```sh
#!/bin/bash

for f in $*; do
  csvgrep --file /tmp/ids.txt -c person_id $f > 250/$f &
done
```

For each file passed into the script, we grep the CSV file for any row that has a person_id that appears in our ids.txt file.

---

# Sticky Situations...

- The most basic scripts are just series of commands that you'd normally type via keyboard
- As your data workflow becomes more intricate, you need to start writing a basic program
  - e.g. If this file doesn't exists, do this
- bash, ksh, zsh, and other shells all have support for flow control and other programming notions
   - But their syntax is clumsy
- Larry Wall and others decided there should be programming languages that aid in "gluing" commands and scripts together

---

# ...Call for Glue Languages

- awk/sed
  - The grandfather of glue languages
- Perl
  - The language that started the glue-language rush
  - Jokingly referred to as a "write-only" programming language
- Ruby/Python
  - Inspired by perl
  - Object Oriented
  - Much cleaner syntax

---

# More Sophisticated 250 Sample

```ruby
require 'tempfile'
require 'pathname'
require 'shell'

ids_file = ARGV[0]

dir = Pathname.new(ARGV[1])
dir_250 = dir + 250.to_s

dir_250.mkpath

sh = Shell.new
temp_files = {}
Dir.glob(dir + "*.csv") do |file|
  file = Pathname.new(file)

  sh.system("csvgrep", "-f", ids_file.to_s, "-c", "person_id", file.to_s) > (dir_250 + file.basename).to_s
end

Dir.glob(dir + "*.csv") do |file|
  file = Pathname.new(file)

  if file.to_s =~ /procedure_occurrence/
    temp_files[:procedure_occurrence_ids] = temp = Tempfile.new("proc_ocs.txt")
    sh.system("csvcut", "-c", "procedure_occurrence_id", file.to_s) > temp.to_s
  end

  if file.to_s =~ /drug_exposure/
    temp_files[:drug_exposure_ids] = temp = Tempfile.new("drug_exps.txt")
    sh.system("csvcut", "-c", "drug_exposure_id", file.to_s) > temp.to_s
  end
end

Dir.glob(dir + "*.csv") do |file|
  if file.to_s =~ /procedure_cost/
    sh.system("csvgrep", "-c", "procedure_occurrence_id", "-f", temp_files[:procedure_occurrence_ids].path, file.to_s) > (dir_250 + File.basename(file)).to_s
  end

  if file.to_s =~ /drug_cost/
    sh.system("csvgrep", "-c", "drug_exposure_id", "-f", temp_files[:drug_exposure_ids].path, file.to_s) > (dir_250 + File.basename(file)).to_s
  end
end

temp_files.values.each(&:close)
```

---

# Make It Work

As projects get to be even bigger, there are ways to capture the data workflow process in a declarative language.

Compiling programs is, in many ways, a data workflow issue.

Code depends on libraries which depend on source files themselves.  Each operating system has its own way of building programs and naming files.

Historically, Unix used "make" and "Makefiles" to capture these dependencies.

---

# Simple Make Example

```demo
cat Makefile
```

---

# Running Make

```demo
make clean
make
cat helloworld
```

---

# Rake - Ruby's Make

Family Tree Example

---

# Stupid Command Line Tricks - cal

```demo
cal
```

---

# Stupid Command Line Tricks - rig
```demo
rig
rig -c 2
```

---

# Stupid Command Line Tricks - fortune

```demo
fortune
fortune -s
```

---

# Very Stupid Command Line Tricks - banner

```demo
echo "stupid" | banner -w 40
```

---

# Very Stupid Command Line Tricks - cowsay

```demo
echo "Why?" | cowsay
```

---

# Very Stupid Command Line Tricks - nested cowsay

```demo
echo "Why?" | cowsay -n | cowsay -n
```

---

# Very, Very Stupid Command Line Tricks

Live demo!

```bash
say "howdy yall"
ponysay "why?"
lolcat README.md
echo "STUPID" | banner -w 40 | lolcat
curl wttr.in
```

---

# Questions?!

man command

```demo
man man | col -b
```

