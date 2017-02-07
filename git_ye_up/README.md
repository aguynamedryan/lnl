# Git Ye Up!

a.k.a Gitting Stuff Done

---

## A Brief Summary of Programmers

Programmers:

- Spend lots of time generating text files (source files) that are full of meticulously crafted magic words (code) in order to get computers to do things (programs).
- Cry when they lose these files.
- Get upset when they change these files and computers suddenly stop doing things correctly.
- Can't remember what they wrote 2 hours ago, let alone 2 months or years ago.
- Often work together on the same files and need to make sure they don't break other programmers' code.

---

## A Programmer's Summary of Researchers

Researchers:

- Spend lots of time generating text files (manuscripts) that are full of meticulously crafted magic words (methods) in order to get journals to do things (publish).
- Cry when they lose these files.
- Get upset when people ask them to change small bits of these files.
- Probably can't remember what they wrote 2 hours ago, let alone 2 months or years ago.
- Often work together on the same files and need to be able to coordinate revisions and comments.

---

## Introducing SCM, Your Time-Traveling, Collaborating, Safety Net

- Programmers often use SCM (Source Code Management) software to address the aforementioned needs
- Sometimes also called Version (or Revision) Control Software

SCM software generally:
- Tracks changes to software files over time
- Maintains a historical record of what happened to source code
- Permits developers to hop back in time to previous versions of source code
- Allows users to view changes between versions of source code
- Helps integrate sets of changes to the same source code file

---

## How SCM Generally Works

- As a programmer makes changes to files, the programmer will occasionally take a snapshot of all the source code files
    - This is called a "commit" or "revision"
    - Commits normally include information about the snapshot, such as
      - Who made it (the author)
      - When it was made (timestamp)
      - A brief message recording why the snapshot was made e.g. what bug was fixed or feature was introduced
    - Only the _changes_ to each file are saved in a commit
- All commits are kept in a single location, called a "repository"
- The repository serves as a backup of the source code and a journal of all the changes to the source code
- Programmers can share commits with a repository, thereby enabling them to collaborate on the same source code

---

## What Commits Look Like

Show 'em!

---

## Common SCM Workflow

![Centralized Workflow](images/centralized_workflow.png)

---

## Common SCM Software

- CVS
    - Was once the workhorse of the Unix world
- SVN
    - Subversion
    - Replacement for CVS
- Git
    - More on this later
- Mercurial
    - Git competitor
- Perforce
    - For sadistic bosses and their masochistic developers

---

## A (Very) Brief History of Git

- 2005, BitKeeper sells out, needs replacement
- Created by Linus Torvalds (creator of Linux)
- Needed a way to coordinate development of the Linux Kernel
    - Hundreds of developers
    - Thousands of patches
    - Maintain safeguards against tampering
    - Be fast
        - At the time kernel files were, 233MB and 11 MLoC
        - Now at 765M and 22 MLoC
        - As of 2015, 7.75 commits per hour, or 10,000 commits per new kernel version

---

## Distributed SCM to the Rescue



## [Git](https://git-scm.com/)

- Snapshots
- History
- Staging
- Diff
- Branches
- Merge
- Rebase

## [GitHub](http://github.com)

- Website to host Git repos
- Provides additional features surrounding repo
    - Issues
        - Labels
        - Milestones
    - Wiki
    - GHFMarkdown
    - "Social" aspects
        - Stars
        - Watching
        - Forking
    - Pull Requests
- Why GitHub all the things?
    - Offsite backup
    - Markdown!
    - Visual diffs
    - No more "v2RSD"

