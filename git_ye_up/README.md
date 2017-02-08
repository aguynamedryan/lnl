# Git Ye Up!

a.k.a Gitting Stuff Done

---

## Programmers

- Spend lots of time generating text files (source files) that are full of meticulously crafted magic words (code) in order to get computers to do things (programs).
- Cry when they lose these files.
- Get upset when they change these files and computers suddenly stop doing things correctly.
- Can't remember what they wrote 2 hours ago, let alone 2 months or years ago.
- Often work together on the same files and need to make sure they don't break other programmers' code.

---

## A Programmer's Take on Researchers

- Spend lots of time generating text files (manuscripts) that are full of meticulously crafted magic words (methods) in order to get journals to do things (publish).
- Cry when they lose these files.
- Get upset when people ask them to change small bits of these files.
- Probably can't remember what they wrote 2 hours ago, let alone 2 months or years ago.
- Often work together on the same files and need to be able to coordinate revisions and comments.

---

## Introducing SCM, Your Time-Traveling, Collaborating, Safety Net

- Programmers often use SCM (Source Code Management) software to address the aforementioned needs
- Sometimes also called Version (or Revision) Control Software

---

## What SCM Software Does

- Tracks changes to software files over time
- Maintains a historical record of what happened to source code
- Permits developers to hop back in time to previous versions of source code
- Allows users to view changes between versions of source code
- Helps integrate sets of changes to the same source code file

---

## SCMs Are About Commitment

- As a programmer makes changes to files, the programmer will occasionally take a snapshot of all the source code files
- This is called a "commit" or "revision"

---

## Contents of a Commit
- Commits normally include information about the snapshot, such as
  - Who made it (the author)
  - When it was made (timestamp)
  - A brief message recording why the snapshot was made e.g. what bug was fixed or feature was introduced
- Only the _changes_ to each file are saved in a commit

---

## Revisionist History

- All commits are kept in a single location, called a "repository"
- The repository serves as a backup of the source code and a journal of all the changes to the source code
- Programmers can share commits between copies of the same repository, thereby enabling them to collaborate on the same source code

---

## A Commit in the Wild

Show 'em!

---

## Common SCM Workflow

![Centralized Workflow](images/centralized_workflow.png)

---

## Common SCM Software

- CVS
    - Was once the workhorse of the Unix world
- Subversion (SVN)
    - Replacement for CVS
- Git
    - More on this later
- Mercurial
    - Git competitor
- Perforce
    - For sadistic bosses and their masochistic developers

---

## A (Very) Brief History of Git

- 1998, Linux kernel starts using BitKeeper
- March 2005, member of Linux community irritates BitMover and licences are revoked
- April 2005, Linux Torvalds, creator of Linux, starts writing Git
- Three weeks later, Git is self-hosting

---

## Git Goals

- Primary use case was to host and coordinate development of the code of the Linux kernel
    - Thousands of developers
    - Tens of thousands of patches
- Maintain safeguards against tampering
- Be fast
    - At the time kernel files were, 233MB and 11 MLoC
    - Now at 765M and 22 MLoC
    - As of 2015, 7.75 commits per hour, or 10,000 commits per new kernel version

---

## Git is Distributed

- Means you can do some fancy things with Git
- But for our purposes, just know that you have a complete copy of the repository on your computer
    - As opposed to having some repository remotely hosted

---

## GitHub - Coordinating Code

- Hosts Git repositories
- Provides a set of additional features to aid in software development

---

## GitHub Features

- Issues
- Markdown
- Wiki
- Pull Requests
- Great visualization tools

---

## GitHub Makes the Diff(erence)

- Show 'em

---

## How to Use Git

- Command line
- GUI
    - https://git-scm.com/download/gui/linux
- Built into your text editor/IDE of choice

---

## Plain Text is Best

- Git loves plain text files
- Tons of great plain text editors
- Markdown is super-great for 90% of the documentation you write

---

## Plain Text Editors

- [vim](http://www.vim.org/)
- [Sublime Text](https://www.sublimetext.com/)
- [Brackets](http://brackets.io/)
- [Atom](https://atom.io/)

---

## Turn a Folder into a Repo

- `git init`

---

## Take a Snapshot

1. Make changes to files
2. `git add .`
3. `git commit --message 'Things are changing around here'`

---

## Relive the Past

- You can view a list of previous commits
    - `git log`
    - `git log -p`
- Or view details about a commit
    - `git show`

---

## Time Travel

- You can checkout a previous version of a file
- `git checkout <sha> -- some_file.md`

---

## Trash the Place

- You can reset your working directory to the last saved snapshot
- `git reset --hard`

---

## Copy Off a Friend

- To pull down a copy of a repo onto your computer
- `git clone <url>`

---

## Push Ups

- To share commits back up to GitHub
- `git push origin master`

---
