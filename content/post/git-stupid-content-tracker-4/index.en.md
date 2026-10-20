---
title: "Git, the stupid content tracker (part 4)"
description: "The anatomy of a commit: hash, author, date and message, then inside the .git folder among objects, trees and blobs, with porcelain and plumbing commands."
slug: git-stupid-content-tracker-4
date: 2017-02-14
lastmod: 2026-10-20
categories:
    - Software
tags:
    - git
    - version control
series: "Git, the stupid content tracker"
part: 4
source: https://mokabyte.it/2017/02/14/git-4/
source_date: 2017-02-14
---

*Part four of the series, first published on [MokaByte](https://mokabyte.it/2017/02/14/git-4/) on 14 February 2017. The text stays as I wrote it then, with a note at the end about what changed.*

## Introduction

In part 3 of this series we got to know some fundamental features of **Git**, including the **three areas** in which files find themselves during the operations we normally perform on them.

In this instalment we will go even deeper, analysing in detail the **structure** of a **commit** and of the elements that make it up.

## Setting name and email

Before going back to talking about **commits**, we need to clarify something about what was written in the previous article. If readers tried to run a **commit** for the first time inside a **Git** **repository**, they may have run into a message like this:

```
[ 1 ] /c/temp/es01 (master)
$ git commit -m "File 01"
*** Please tell me who you are.
Run
git config --global user.email "you@example.com"
 git config --global user.name "Your Name"
to set your account's default identity.
 Omit --global to set the identity only in this repository.
fatal: unable to auto-detect email address (got 'nando@computer.(none)')
```

Git expects every **commit** to be "signed" by the **person** who **made** it, and it also wants an **email** **address** for them. This requirement was deliberate from the start, so that for every change made to a project the author could be traced and contacted if needed.

### Signing the commit

If we do not tell Git **who** **we** **are**, it tries to infer it from the system configuration; it therefore tries to read the user information and the related email from the operating system; if it cannot "work it out", it shows the message above, insisting that we configure this information properly before going on with the **commit**.

Without getting too distracted, for now let us proceed as suggested; in the next instalments we will look more closely at the **configuration** system of **Git**.

So let us type these two commands:

```
[ 1 ] /c/temp/es01 (master)
 $ git config --global user.email "jesus_was_rasta@yahoo.it"
```

```
[ 2 ] /c/temp/es01 (master)
 $ git config --global user.name "Ferdinando Santacroce"
```

**Git** will give no reply but will simply set these **pieces** **of** **information** in its **global** **configuration**: from now on, in every repository where you make commits, they will be "headed" to your name.

And now let us go back to the main topic of this instalment.

## Commits

In the previous instalments we made a simple **commit**, without dwelling too much on its **structure**. Now, however, the time has come to look more closely at these "building blocks" that shape our **repository**.

If you still have the **repository** created last time at hand, good; otherwise I refer you to the previous article for instructions on creating it from scratch.

Once inside the repository folder, let us try typing **git** **log**, a new command we are about to meet:

```
[ 1 ] /c/temp/es01 (master)
$ git log
 commit 4004a1197c9078a8a39e92734e939631926360fc
 Author: Ferdinando Santacroce <jesus_was_rasta@yahoo.it>
 Date:   Sat Feb 4 09:48:21 2017 +0100
First commit, file01
```

The **git** **log** command lets us see the **history** of our **repository**; typed without any other option, it returns the **list** of **commits** made, in **reverse** **chronological** **order**. What we see, in fact, is the first and only commit we made in the previous instalment, containing a text file.

### A note on the prompt configuration

A small aside: as you will have noticed, the **prompt** of the **console** currently in use is slightly different from the standard one; I removed information I consider of little use, namely the part showing user@computer, I already know who I am…, and the environment in use (MINGW64); in their place I added a **little** **number** in **square** **brackets**, which increases with every command: this will let me describe more easily the steps we take during our experiments.

If you want to customise your [MinTTY](https://mintty.github.io/) shell too, the official documentation explains how.

## The hash

Let us now analyse a little the information we are given. The first line shows the **SHA-1** of the **commit**, an **alphanumeric** **sequence** of 40 characters. This "code", or **hash** as it is usually called, **uniquely** **identifies** the commit inside the repository, and it is thanks to it that from now on we can refer to it when performing certain actions we will test shortly.

Just to try, let us make a second commit in our repository and then run **git** **log** again, to verify what was said before; let us create a **file02.txt** and modify it as we like:

```
[ 2 ] /c/temp/es01 (master)
 $ vim file02.txt
```

Right after, let us add the file to the **staging** **area**, then make its commit:

```
[ 3 ] /c/temp/es01 (master)
 $ git add file02.txt
[ 4 ] /c/temp/es01 (master)
 $ git commit -m "Add a 2nd file"
 [master 0763bf3] Add a 2nd file
 1 file changed, 1 insertion(+)
 create mode 100644 file02.txt
```

Now let us try typing the **git** **log** command again:

```
[ 5 ] /c/temp/es01 (master)
 $ git log
 commit 0763bf3adfe5699ff890d535b69299e5db39b737
 Author: Ferdinando Santacroce <jesus_was_rasta@yahoo.it>
 Date:   Sat Feb 4 10:03:44 2017 +0100
Add a 2nd file
commit 4004a1197c9078a8a39e92734e939631926360fc
 Author: Ferdinando Santacroce <jesus_was_rasta@yahoo.it>
 Date:   Sat Feb 4 09:48:21 2017 +0100
First commit, file01
```

Now **two** commits appear, with **two** **distinct** **hashes**, sorted in reverse chronological order.

Now let us use **git** **log** asking it to show only one particular commit, the first one, by giving the first characters of the hash:

```
[ 6 ] /c/temp/es01 (master)
 $ git log 4004a11
 commit 4004a1197c9078a8a39e92734e939631926360fc
 Author: Ferdinando Santacroce <jesus_was_rasta@yahoo.it>
 Date:   Sat Feb 4 09:48:21 2017 +0100
First commit, file01
```

With this small experiment we learned two new things: that **git** **log** can be called by specifying the **hash** of the **commit** we want to see, but above all that **you do not always need to write the whole hash**, it is **enough to give the first characters**. The minimum number of characters you can type is usually 4, and it is governed by a particular configuration entry, **core.abbrev**; as you can imagine, however, over time 4 characters may no longer be enough to tell a given commit apart: it all depends on how big the repository we are working in is; the bigger it is, the higher the risk of "collisions" between the first characters of a hash.

### Further thoughts on the hash

In any case, keep this in mind: the **Linux** **kernel** is today one of the biggest projects managed with **Git**, with its **more than six hundred thousand commits**. And yet, in that **repository**, **only 12 characters** are enough to uniquely identify a commit.

Git's **default** is to use the first **7 characters**: if you go back and look, when we make a **commit**, **Git** itself shows in square brackets the first **7 characters** of the commit created. Do not worry anyway: if while running a command Git cannot **uniquely** identify a commit with the set of characters you gave it, it will not fail to warn you.

If instead you are curious to know exactly the **minimum** **number** of characters needed to identify a commit, or indeed any Git object, as we will see later, you can try this command:

```
[ 7 ] /c/temp/es01 (master)
 $ git rev-parse --short=3 4004a1197c9078a8a39e92734e939631926360fc
 4004
```

The **git** **rev-parse** command with the **--short=<number of characters>** option can tell us, relative to the minimum number of characters we want, what the minimum sequence of characters is that we must give to be sure, in the current state of the repository, of uniquely identifying the commit in question. In this case we tried to see whether **3 characters** would be enough, but Git promptly told us that the minimum sequence to give is made of the **first 4 characters**, **4004**.

I digressed and introduced this command to satisfy a possible curiosity of the reader; and at this point let me take the chance to introduce another peculiarity of **Git**, namely the split between **porcelain** and **plumbing** commands.

## Porcelain and plumbing commands

Git, as we know, has a **myriad** of **commands**, some of which are practically never used by the average user, such as the aforementioned **git** **rev-parse**. These commands are called **plumbing commands**, while those we have already learned to know, like **git** **add**, **git** **commit** and so on, are counted among the so-called **porcelain commands**.

The **metaphor** comes straight from the fertile imagination of Linus Torvalds, Git's father, and has to do with **plumbers**. They, as is well known, also take care of the maintenance of bathroom fixtures; let us take as reference "the throne", the bowl where we do our business. It is made of a **porcelain** artefact, which allows us a comfortable seat, and of a series of **pipes** and **ducts** (in English, *plumbing*) that instead allow what is produced to be flushed down into the sewer system.

Linus used this lofty metaphor to split Git commands into two families: the higher-level ones, comfortable for a user interested in the most common operations (**porcelain**), and those usable at the discretion of more expert users to perform lower-level operations (**plumbing**).

We can therefore consider **porcelain** commands as "interface" commands towards the user, while **plumbing** ones work "at a low level". This also means that **porcelain** commands stay more "stable" over time, because how they are used and their options change more cautiously and over longer periods, since they are used directly but also implemented in many graphical tools, editors and so on; **plumbing** ones, instead, being less commonly used, evolve with fewer restrictions.

There is no precise split between these two categories of commands, since the boundary is often rather blurred; we will use them again anyway, to better observe and understand how Git works inside.

Let us now go back directly to the topic of this instalment, and resume the analysis of **commits**.

## Anatomy of a commit

Let us repeat here for convenience the output of the **git** **log** command typed at the beginning:

```
[ 1 ] /c/temp/es01 (master)
 $ git log
 commit 4004a1197c9078a8a39e92734e939631926360fc
 Author: Ferdinando Santacroce <jesus_was_rasta@yahoo.it>
 Date:   Sat Feb 4 09:48:21 2017 +0100
First commit, file01
```

Besides the **hash** already mentioned, let us look at the other information present. First of all we find the information about the **author** of the commit, then the **date** and **time** at which it appears to have been made; last, the **commit** **message** is shown, as we entered it.

The author information serves to make traceable the person who made the changes in the commit; given that Git and version control systems were also born to let people collaborate, having an explicit reference is certainly not unwelcome, quite the opposite.

But how is a commit **saved**? And above all, where? The time has come to "open the bonnet" and stick our nose inside Git's "engine".

## The .git folder

When we create a new **Git** **repository** with the **git** **init** command, what happens in practice is the creation of a **dotfolder** named **.git** inside the **folder** where we type the command. Let us see what is inside: let us type the **ll** command (an alias of **ls -l**) in our shell:

```
[ 2 ] /c/temp/es01 (master)
 $ ll .git/
 total 21
 drwxr-xr-x 1 san 1049089   0 Feb 4 10:03 ./
 drwxr-xr-x 1 san 1049089   0 Feb 4 10:03 ../
 -rw-r--r-- 1 san 1049089 15 Feb 4 10:03 COMMIT_EDITMSG
 -rw-r--r-- 1 san 1049089 201 Feb 4 09:48 config
 -rw-r--r-- 1 san 1049089 73 Feb 4 09:44 description
 -rw-r--r-- 1 san 1049089 23 Feb 4 09:44 HEAD
 drwxr-xr-x 1 san 1049089   0 Feb 4 09:44 hooks/
 -rw-r--r-- 1 san 1049089 225 Feb 4 10:03 index
 drwxr-xr-x 1 san 1049089   0 Feb 4 09:44 info/
 drwxr-xr-x 1 san 1049089   0 Feb 4 09:48 logs/
 drwxr-xr-x 1 san 1049089   0 Feb 4 10:03 objects/ #objects folder
 drwxr-xr-x 1 san 1049089   0 Feb 4 09:44 refs/
```

Let us focus for a moment on the **objects** folder, and ignore the rest; let us go in and see what it contains:

```
[ 3 ] /c/temp/es01 (master)
 $ ll .git/objects/
 total 8
 drwxr-xr-x 1 san 1049089 0 Feb 4 10:03 ./
 drwxr-xr-x 1 san 1049089 0 Feb 4 10:03 ../
 drwxr-xr-x 1 san 1049089 0 Feb 4 10:03 07/
 drwxr-xr-x 1 san 1049089 0 Feb 4 10:03 30/
 drwxr-xr-x 1 san 1049089 0 Feb 4 09:48 40/ #40 folder
 drwxr-xr-x 1 san 1049089 0 Feb 4 09:48 4b/
 drwxr-xr-x 1 san 1049089 0 Feb 4 09:45 a9/
 drwxr-xr-x 1 san 1049089 0 Feb 4 09:48 c2/
 drwxr-xr-x 1 san 1049089 0 Feb 4 09:45 f5/
 drwxr-xr-x 1 san 1049089 0 Feb 4 09:44 info/
 drwxr-xr-x 1 san 1049089 0 Feb 4 09:44 pack/
```

You will notice there is a folder called "**40**"; let us see what is inside:

```
[ 4 ] /c/temp/es01 (master)
 $ ll .git/objects/40
 total 5
 drwxr-xr-x 1 san 1049089   0 Feb 4 09:48 ./
 drwxr-xr-x 1 san 1049089   0 Feb 4 10:03 ../
 -r--r--r-- 1 san 1049089 145 Feb 4 09:48 04a1197c9078a8a39e92734e939631926360fc
```

Mmm… There is a file without an extension called

```
04a1197c9078a8a39e92734e939631926360fc
```

If however I do:

```
40 + 04a1197c9078a8a39e92734e939631926360fc
```

I get

```
4004a1197c9078a8a39e92734e939631926360fc
```

that is, the **hash** of the **first** **commit** we made!

### Simple, organised folders

I suspect you have already guessed: Git saves **commits** as **files** in **simple** **folders**, organising the latter in a structure of subfolders to make access from the **file** system faster.

If we try to open that file with an **editor**, the result will be a failure: we will see only a string of unintelligible characters. There is however a **plumbing** command that can help us, **git** **cat-file**; let us try typing it followed by the **first 7 characters** of the **commit**'s **hash**, using the **-p** option as shown below:

```
[ 5 ] /c/temp/es01 (master)
 $ git cat-file -p 4004a11
 tree c24e325c8a82a3750bc7853552a08735ae5d494c
 author Ferdinando Santacroce <jesus_was_rasta@yahoo.it> 1486198101 +0100
 committer Ferdinando Santacroce <jesus_was_rasta@yahoo.it> 1486198101 +0100
First commit, file01
```

This command lets us peek inside Git's **objects**, which we will discuss at length in the next instalment, and **commits** are among these **objects**. With the **-p** option we asked to show in a more readable form what the content of the aforementioned **object** was, and Git promptly showed us what you see above.

### The content of the commit

The line showing the **author** is easy to understand, since it reports the information already given and discussed; the **committer**, which in this case coincides with the **author**, represents instead the subject who made the commit. Now you will be asking: why two different names? Are they not always the same person? In fact 99% of the time they are, but it is possible that at commit time you want to indicate a different author for some reason, for example if we are about to commit changes someone passed to us "offline", using the appropriate **--author=<author>** option. In cases like these, the commit would have an **author** **different** from the **committer**, which instead cannot be altered.

Finally, we find a line saying:

```
tree c24e325c8a82a3750bc7853552a08735ae5d494c
```

What does it mean? The **tree** is another of the **objects** managed by Git, and represents a **container** of files: let us imagine it as if it were a folder.

### The content of the tree

Using the same procedure as before, we can check that in Git's **/objects** folder there is a subfolder named **c2**, and inside it there is a file

```
4e325c8a82a3750bc7853552a08735ae5d494c
```

Let us try to see what this further Git **object** contains, again using the **git** **cat-file** **-p** command:

```
[ 6 ] /c/temp/es01 (master)
 $ git cat-file -p c24e325
 100644 blob 4bc92d99949138eb83452d857e5c504471e30805   file01.txt
```

This **tree**, which we said is something Git uses to identify a folder, contains in turn a further **object**, called a **blob**: on the right, however, "**file01.txt**" is shown, which makes us guess that for Git **blobs** represent **files**. As before, we can check that this **blob** is saved in a subfolder called "**4b**", and we can again go and see its content:

```
[ 7 ] /c/temp/es01 (master)
 $ git cat-file -p 4bc92d9
 File 00
```

What appears below, "**File 00**", is exactly the text contained in my **.txt** file: with little imagination, when I created it I wrote just these two words inside.

For confirmation, we can use the **cat** command, which on Unix systems lets you see the content of a file:

```
[ 8 ] /c/temp/es01 (master)
 $ cat file01.txt
 File 00
```

As you can see, the result is the same.

## Conclusions

We still have a lot to say to close this discussion, but the space we have ends here.

In the next instalment we will look in detail at what was anticipated in this last part of the article, that is, the system with which Git organises and saves information inside itself (**objects store**). Once we **understand** the **way** Git **stores** our **data**, the **commands** we will use will seem a little less abstruse than they would otherwise be.

## 2026 note

The anatomy of a commit has not changed: hash, author, date, message, and inside `.git/objects` blobs, trees and commits are still organised as in this article. Three things to know if you are following the steps today:

- Git still computes hashes with SHA-1 by default, as it did then. Repositories using SHA-256 exist, but they are rare and do not change the reasoning: the hash identifies the content.
- The length of the abbreviated hash is no longer fixed at 7 characters: since version 2.11 Git computes it from the size of the repository and lengthens it on its own when needed. `core.abbrev` still exists, but the default value is `auto`.
- The initial branch is no longer called `master`, but `main`. In the examples from back then you will read `master`.

The email address in the examples is the one I used in 2017 and is no longer active: put yours.
