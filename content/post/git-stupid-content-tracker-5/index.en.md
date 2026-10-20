---
title: "Git, the stupid content tracker (part 5)"
description: "Blobs and trees, the objects that hold version control together: unique hashes, space savings and the content of an object seen with git hash-object and git cat-file."
slug: git-stupid-content-tracker-5
date: 2017-04-10
lastmod: 2026-10-20
categories:
    - Software
tags:
    - git
    - version control
series: "Git, the stupid content tracker"
part: 5
source: https://mokabyte.it/2017/04/10/git-5/
source_date: 2017-04-10
---

*Part five of the series, first published on [MokaByte](https://mokabyte.it/2017/04/10/git-5/) on 10 April 2017. The text stays as I wrote it then, with a note at the end about what changed.*

## Git objects

In the previous instalment, part four of this series, we got to know **blobs**, **trees** and **commits**, three of the four **Git objects**, that is, the components at the base of the **storage** system Git uses.

In this new instalment we will try to understand better the **structure** and **role** of **blobs** and **trees**, in order to learn the foundations on which our beloved version control system stands.

Git uses four different types of **objects**: **commit**, **tree**, **blob** and **tag**. Let us leave **tags** aside for a moment, anyone who already uses a version control system knows what they are, and also **commits**, and focus on the first two.

## Blobs

**Blobs** are **binary** files, nothing more and nothing less. These sequences of bytes, not interpretable "by the naked eye", hold inside them the (compressed) information belonging to any file, be it binary or textual, whether images, source code, archives… Everything is **compressed** and turned into a **blob** before being attached to a Git **repository**.

As seen before, every file is marked with a **hash**; this hash uniquely identifies the file inside our repository, and it is thanks to this "id" that Git can then retrieve it when needed and detect any changes when the same file is altered.

### Unique hashes

We said that SHA-1 hashes are unique; but what does that mean? Let us try to understand it better with an example.

Let us open a Bash shell and play a little with another **plumbing** command, **git hash-object**:

```
[1] /home
$ echo "mokabyte" | git hash-object --stdin
4ee6192013be74aa054f203efd55a5e8d0f7c443
```

The **git hash-object** command is the one in charge of computing the hash of any object; here we used the **--stdin** option to pass as argument of the command the result of the command preceding it, that is **echo "mokabyte"**; in short, we computed the hash of the string "mokabyte", and out came

```
4ee6192013be74aa054f203efd55a5e8d0f7c443
```

And did you try on your computer? What is the result? A little suspense… Incredible, it is the same! Try running the command again as many times as you like, the resulting hash will always be the same.

This makes us understand something very important: **an object**, whatever it is, **will always have the same hash in any repository**, on any computer on the face of the Earth. The more expert and shrewd ones had probably already "got wind of it" for a while, but I hope I still aroused in the rest of the readers the same wonder that struck me when I first realised this fact, especially since the implications are many.

### Analysing objects

But let us make another attempt; this time we will use the **git cat-file** command, another **plumbing** command that comes to our aid when we need to analyse objects.

Let us take our old **repository** again, or recreate it following the previous article, and go and look at the hash of the blob identifying **file01.txt**, one of the files committed in our previous experiments. Now let us create a new file, called **file99.txt**, and write inside it the same thing that is written in **file01.txt**: in my case, "File 00"… forgive the lack of imagination.

```
[2] /home
$ cd es01/  #let us enter the folder of our old repository
[3] /home/es01 (master)
$ git log   #let us use git log to learn the hash of the first commit
commit 0763bf3adfe5699ff890d535b69299e5db39b737
Author: Ferdinando Santacroce <jesus_was_rasta@yahoo.it>
Date:   Sat Feb 4 10:03:44 2017 +0100
Add a 2nd file
commit 4004a1197c9078a8a39e92734e939631926360fc
Author: Ferdinando Santacroce <jesus_was_rasta@yahoo.it>
Date:   Sat Feb 4 09:48:21 2017 +0100
First commit, file01
[4] /home/es01 (master)
$ git cat-file -p 4004a11    #let us check the content of the first commit
tree c24e325c8a82a3750bc7853552a08735ae5d494c
author Ferdinando Santacroce <jesus_was_rasta@yahoo.it> 1486198101 +0100
committer Ferdinando Santacroce <jesus_was_rasta@yahoo.it> 1486198101 +0100
First commit, file01
[5] /home/es01 (master)
$ git cat-file -p c24e325    #let us check the content of the tree
100644 blob 4bc92d99949138eb83452d857e5c504471e30805   file01.txt
[6] /home/es01 (master)
$ cat file01.txt  #bingo! Let us check the content of file01.txt
File 00
[7] /home/es01 (master)
$ touch file99.txt     #let us create a new file
[8] /home/es01 (master)
$ vi file99.txt   #let us edit it, writing exactly "File 00" as above
[9] /home/es01 (master)
$ git hash-object file99.txt #let us compute its hash… et voilà!
4bc92d99949138eb83452d857e5c504471e30805
```

Did you notice? The **hash** of **file99.txt** is the same as that of **file01.txt**!

### Smart space saving

When I talked about implications, I meant exactly this: **Git** proves **truly effective** at **saving space**. Since it always computes the **hash** before storing any content, the moment that content is the same, Git will "recycle" the same **blob**, referencing the same sequence of bytes in all the **trees** that contain this file.

Shall we check?

```
[10] /home/es01 (master)
$ git status      #let us check the state of the repository
On branch master
Untracked files:
(use "git add <file>..." to include in what will be committed)
file99.txt
nothing added to commit but untracked files present (use "git add" to track)
[11] /home/es01 (master)
$ git add file99.txt   #let us add file99.txt to the staging area
[12] /home/es01 (master)
$ git commit -m "File 99"    #let us make the commit
[master 21f5b03] File 99
1 file changed, 1 insertion(+)
create mode 100644 file99.txt
[13] /home/es01 (master)
$ git log --format=oneline   #let us check the commits in the repository
21f5b031a14d5a6573b281efce1e90e2ebada6d1 File 99
0763bf3adfe5699ff890d535b69299e5db39b737 Add a 2nd file
4004a1197c9078a8a39e92734e939631926360fc First commit, file01
[14] /home/es01 (master)
$ git cat-file -p 21f5   #let us analyse the content of the last commit
tree ac330d0db71feeeb30878161c6a3262a96fa9206
parent 0763bf3adfe5699ff890d535b69299e5db39b737
author Ferdinando Santacroce <jesus_was_rasta@yahoo.it> 1490645210 +0200
committer Ferdinando Santacroce <jesus_was_rasta@yahoo.it> 1490645210 +0200
File 99
[15] /home/es01 (master)
$ git cat-file -p ac330 #let us see what is in the tree…
100644 blob 4bc92d99949138eb83452d857e5c504471e30805   file01.txt
100644 blob 3068da2f51efe3cf462ba64c2bb77a8ee333297c   file02.txt
100644 blob 4bc92d99949138eb83452d857e5c504471e30805   file99.txt
```

See? Inside the **tree** of the last commit Git correctly lists all three files currently part of our repository, each with its own name beside it. The nice thing is that **file01.txt** and **file99.txt** reference the same **blob**, that is the same file; in substance, even if "in the real world" we have 3 distinct files, each with its own "weight" in kilobytes, in Git only two files out of three are stored, since the content of **file01.txt** and **file99.txt** is the same.

### Flexibility of the blob

And if the content of the file changed?

```
[16] /home/es01 (master)
$ echo "Hey file99, it's time to grow up!" >> file99.txt
[17] /home/es01 (master)
$ git add file99.txt
[18] /home/es01 (master)
$ git commit -m "File99 modified"
[master d604050] File99 modified
1 file changed, 1 insertion(+)
[19] /home/es01 (master)
$ git log --format=oneline
d60405094aab74f81847169a4c1ec81334311b68 File99 modified
21f5b031a14d5a6573b281efce1e90e2ebada6d1 File 99
0763bf3adfe5699ff890d535b69299e5db39b737 Add a 2nd file
4004a1197c9078a8a39e92734e939631926360fc First commit, file01
[20] /home/es01 (master)
$ git cat-file -p d6040
tree 7c27b93a379d5c12d0ee3504ddb28378179104a7
parent 21f5b031a14d5a6573b281efce1e90e2ebada6d1
author Ferdinando Santacroce <jesus_was_rasta@yahoo.it> 1490646695 +0200
committer Ferdinando Santacroce <jesus_was_rasta@yahoo.it> 1490646695 +0200
File99 modified
[21] /home/es01 (master)
$ git cat-file -p 7c27b
100644 blob 4bc92d99949138eb83452d857e5c504471e30805   file01.txt
100644 blob 3068da2f51efe3cf462ba64c2bb77a8ee333297c   file02.txt
100644 blob b86472331ae95fbeadd30f0d017460a67f589eea   file99.txt
```

At this point no more explanation should be needed: when the content of a file changes, its **hash** changes too: in the **tree** of the last commit you will in fact have noticed that the hash of **file99.txt** has changed. Git now has **two distinct files** in its archive, the **file99.txt** committed the first time and the one committed last, with all its differences.

Now that the role of **blobs** is a little clearer, it is time to spend a few words on trees.

## Trees

**Trees** act as **containers** of **blobs** and other **trees**. The simplest way to understand how they work is to think of the **folders** of your operating system, which likewise do the job of organising files and other subfolders inside them.

Like all other objects, **trees** too are stored as simple text files zipped in the **.git/objects** folder, and they have a **hash** that distinguishes them; for them too the **hash** is computed from the content of the file representing them. It follows that for **trees** as well, Git "recycles" them as soon as the occasion arises.

### Decompressing an object

Talking about files representing **objects**, I realise only now that I forgot to say something important, which is worth underlining.

Using the **git cat-file -p** command we could "stick our nose" inside the object files; the command in question does nothing but **unzip** and show us the most relevant part of the decompressed file content: Git omits only the header line containing the type and size of the object. This means that if you take any object and try to decompress it, using the [zlib](https://zlib.net/) library, you will get a simple **text** **file**, showing the lines printed by the **git cat-file** command.

This highlights once again the **simplicity** of Git: no metadata, internal databases or useless complexity, but **simple** **files** and **folders** are enough to make the management of any **repository** possible.

## Conclusions

And this instalment is over too. Next time we will close the discussion on objects, looking in more detail at **commits**. We will then go on to introduce **references**, that is, the "little flags" Git lets us plant whenever we want to mark a point of particular interest in the history of our repository.

## 2026 note

The object model is the same: a blob is the content of a file, a tree is a folder, a commit points to a tree and to one or more parents, and everything is addressed by content. Two things to know if you are following the examples today:

- The hashes in the examples are SHA-1, still Git's default. Repositories using SHA-256 exist, but the principle does not change: same content, same hash.
- The initial branch is no longer called `master`, but `main`; in the old output you will read `master`.

The `git cat-file -p` command is still the most direct way to look inside an object, and it is useful every time you want to understand what Git actually stored.
