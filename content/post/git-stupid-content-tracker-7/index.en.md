---
title: "Git, the stupid content tracker (part 7)"
description: "Branches are labels: refs, HEAD, creating a branch, checkout and the files that change on disk, with the graph log."
slug: git-stupid-content-tracker-7
date: 2017-07-15
lastmod: 2026-10-20
categories:
    - Software
tags:
    - git
    - version control
series: "Git, the stupid content tracker"
part: 7
source: https://mokabyte.it/2017/07/15/git-7/
source_date: 2017-07-15
---

*Part seven of the series, first published on [MokaByte](https://mokabyte.it/2017/07/15/git-7/) on 15 July 2017. The text stays as I wrote it then, with a note at the end about what changed.*

## Repositories and trees

In the previous articles we saw that a Git **repository** can be imagined as a **tree** which, starting from a common **root** (the **root-commit**), grows upwards through one or more **branches**. These branches, or **branch** as they are usually called in version control systems, are normally distinguished by a name. Git is no exception here; if you remember, in fact, the experiments conducted so far have led us to make commits on the **master** branch of our test repository. "**master**" is precisely the name of the default branch of a Git repository, a bit like "**trunk**" is for Subversion.

The analogies with **Subversion** end here, though: we will now see how Git manages branches, and for Subversion users it will be a real surprise…

## A matter of labels

In Git a branch is nothing but a **label**, a moving **tag** placed on a commit; it would be hard otherwise to move around inside a repository, when commits are not marked by a simple progressive number like Subversion revisions, but by an endless 40-character **hashcode**…

Let us create an empty Git repository again, and see how the **master** branch behaves as we make commits:

```
[1] /home
$ mkdir es03
[2] /home
$ cd es03
[3] /home/es03
$ git init
Initialized empty Git repository in C:/Users/home/es03/.git/
[4] /home/es03 (master)
$ echo "penna" >> cancelleria.txt
[5] /home/es03 (master)
$ git add cancelleria.txt
[6] /home/es03 (master)
$ git commit -m "Aggiunge una penna alla lista della cancelleria"
[master (root-commit) 6cf12f4] Aggiunge una penna alla lista della cancelleria
1 file changed, 1 insertion(+)
create mode 100644 cancelleria.txt
```

OK, no explanation should be needed: we created a folder and initialised a new repository; we created the **cancelleria.txt** file, containing a pen, and made the first commit.

### Adding new commits to the master branch

At this point it would be nice to interact and see together in "real time" what happens to the master branch when a new commit is added, but unfortunately we are not on YouTube… So I will try to tell you about it, asking you readers for a little extra effort to grasp what happens.

Let us start by checking the current state of the repository; we do it using the **git log** command, adding a few options:

```
[7] /home/es03 (master)
$ git log --graph --decorate --oneline
* 6cf12f4 (HEAD -> master) Aggiunge una penna alla lista della cancelleria
```

Let us look in detail at what the options used do.

- **--graph**: here it does nothing but add an asterisk on the left, before the commit hash; when we have more branches, this option will draw the branches of the repository for us, giving us a simple but effective graphical representation.
- **--decorate**: this option "decorates" the log message, adding small graphical artefacts that again help us understand better the situation in front of us; here it draws the -> arrow between the words "**HEAD**" and "**master**".
- **--oneline**: this one is easy… It shows each commit on a single line, abbreviating where necessary.

Good, let us now make a second commit:

```
[8] /home/es03 (master)
$ echo "matita" >> cancelleria.txt
[9] /home/es03 (master)
$ git commit -am "Aggiunge una matita"
[master 87cacc7] Aggiunge una matita
1 file changed, 1 insertion(+)
```

Did you notice? After adding a pencil to our list, I made a commit without running **git add** first; the "trick" is the **-a** (**--add**) option added to the commit command, which means "add to this commit all the modified files I had already committed before". In our case, then, this option saved us from running **git add cancelleria.txt**.

This set of "files already added to the repository before" are called **tracked** files.

OK, at this point we have two commits; let us run the log command seen before again, and see what it says:

```
[10] /home/es03 (master)
$ git log --graph --decorate --oneline
* 87cacc7 (HEAD -> master) Aggiunge una matita
* 6cf12f4 Aggiunge una penna alla lista della cancelleria
```

Interesting! Both "HEAD" and "master" have now moved to the second commit; what does that mean?

## Branches are simple labels

In the previous instalments we saw how **commits** are tied to one another by a "family" relationship: every commit **contains** a **reference** to the previous commit; this means that to "navigate" inside a repository I cannot start, for example, from the first commit and try to go to the next one, because a commit has no reference to what comes after it, only to what comes before. Staying with our "tree" metaphor, this means our tree can only be navigated starting from the "**leaves**", that is, from the outermost points "up there", and then down until reaching the **root-commit**.

**Branches** are nothing but **labels** sitting "on the **leaves** of the branches"; take a **branch**, and it will be made of a series of commits following one another; **the last commit**, our leaf, must always be **identified** by a **label** so that it is **reachable** when navigating inside a repository. Otherwise we would have to remember, for every branch of our repository, the **hash code** of the last commit made there, and I leave to you how easy that would be…

### How references work

So, every time we make a commit in a branch, the "reference" identifying that **branch** will move accordingly, to stay **always** **associated** with the last commit made on that branch.

But how does Git manage this feature? Let us stick our nose into the ".git folder" again:

```
[11] /home/es03 (master)
$ ll .git/
total 17
drwxr-xr-x 1 san 1049089   0 Jun 28 21:32 ./
drwxr-xr-x 1 san 1049089   0 Jun 28 21:12 ../
-rw-r--r-- 1 san 1049089 20 Jun 28 21:32 COMMIT_EDITMSG
-rw-r--r-- 1 san 1049089 208 Jun 28 21:13 config
-rw-r--r-- 1 san 1049089 73 Jun 28 21:11 description
-rw-r--r-- 1 san 1049089 23 Jun 28 21:11 HEAD
drwxr-xr-x 1 san 1049089   0 Jun 28 21:11 hooks/
-rw-r--r-- 1 san 1049089 145 Jun 28 21:32 index
drwxr-xr-x 1 san 1049089   0 Jun 28 21:11 info/
drwxr-xr-x 1 san 1049089   0 Jun 28 21:14 logs/
drwxr-xr-x 1 san 1049089   0 Jun 28 21:32 objects/
drwxr-xr-x 1 san 1049089   0 Jun 28 21:11 refs/ #let us take a look here…
[12] /home/es03 (master)
$ ll .git/refs
total 4
drwxr-xr-x 1 san 1049089 0 Jun 28 21:11 ./
drwxr-xr-x 1 san 1049089 0 Jun 28 21:32 ../
drwxr-xr-x 1 san 1049089 0 Jun 28 21:32 heads/ #this is where Git keeps branches
drwxr-xr-x 1 san 1049089 0 Jun 28 21:11 tags/
[13] /home/es03 (master)
$ ll .git/refs/heads/
total 1
drwxr-xr-x 1 san 1049089 0 Jun 28 21:32 ./
drwxr-xr-x 1 san 1049089 0 Jun 28 21:11 ../
-rw-r--r-- 1 san 1049089 41 Jun 28 21:32 master #...indeed there is a "master" file
[14] /home/es03 (master)
$ cat .git/refs/heads/master
87cacc7d1aafa56815baa14a3ca23afd339e60c7 #but this is the hash of the commit!
[15] /home/es03 (master)
$ git log --graph --decorate --oneline
* 87cacc7 (HEAD -> master) Aggiunge una matita
```

As one could imagine, Git manages this whole elaborate system of references… with a plain text file containing the hash of the last commit made on the branch!

It has been a while since the first time now, but I still keep being amazed at how essential and effective Git's internal structure is.

## Creating a new branch

Now that we are warmed up, the fun begins; let us see what happens when we ask Git to create a new **branch**. Since we spare nothing in our office, besides the **stationery** let us make a list for **drinks**, in a separate branch named "**bevande**":

```
[16] /home/es03 (master)
$ git branch bevande        #I create the branch
[17] /home/es03 (master)
$ git checkout bevande      #I move to the branch just created
Switched to branch 'bevande'
[18] /home/es03 (bevande)
$ echo "acqua" >> bibite.txt
[19] /home/es03 (bevande)
$ git add bibite.txt
[20] /home/es03 (bevande)
$ git commit -m "Aggiunge l'acqua alle bibite" #I commit a new file
[bevande 4072e76] Aggiunge l'acqua alle bibite
1 file changed, 1 insertion(+)
create mode 100644 bibite.txt
[21] /home/es03 (bevande)
$ git log --graph --decorate --oneline
* 4072e76 (HEAD -> bevande) Aggiunge l'acqua alle bibite
* 87cacc7 (master) Aggiunge una matita
* 6cf12f4 Aggiunge una penna alla lista della cancelleria
```

Now things start to get interesting; in this passage we introduced two new commands:

- **git branch** <branch name>: with the **branch** command, followed by a word, we ask Git to create a **new branch** with that **name**; to be honest there are some rules to respect and things to know about possible branch names, but for now let us settle for what we have learned, which is enough to work.
- **git checkout** <branch name>: with the **checkout** command, again followed by the name of an existing branch, we ask Git to **move** us to the branch just created.

### More information

Once moved to the new branch, we made a new commit, creating the new **bibite.txt** file. What we see in the following log brings to light some facts we absolutely need to dig into; I repeat the previous log command here so that I can comment on it in detail:

```
[21] /home/es03 (bevande)
$ git log --graph --decorate --oneline
* 4072e76 (HEAD -> bevande) Aggiunge l'acqua alle bibite
* 87cacc7 (master) Aggiunge una matita
* 6cf12f4 Aggiunge una penna alla lista della cancelleria
```

As you can see, following the new commit made on the **bevande** branch, in the log we see a new line (hash **4072e76**); next to the commit the words **bevande** and **HEAD** have moved too: so it is now clear to us that the **writing** appearing to the **right** of the commit represents the **name** of the **branch** where that commit is present, and represents its **leaf**, that is, the last commit made.

The **master** label, instead, stayed on the commit where it was before: we made the commit on a different branch, and therefore "abandoned" **master** for a moment; so this **branch** stays still where we left it.

The curious thing, though, is this **HEAD** writing that instead follows us in every move, always staying tied to the last commit made: but what does it mean?

## HEAD, or "you are here"

I think by now it is clear; **HEAD** is a **particular "label"** Git gives us to understand at any moment **where we are** inside our **repository**.

**HEAD** generally points to the **branch** we are **currently on**; that is in fact why in the previous log command we see an arrow going from **HEAD** to the branch, for example **HEAD -> bevande**; that arrow is the way Git uses to tell us "Hey, know that HEAD points to the **bevande** branch; the commits you make will therefore be added to that branch".

Here too Git uses a simple text file to store this information; if you go and peek into the **.git folder** you will in fact notice a file called **HEAD**:

```
[22] /home/es03 (bevande)
$ cat .git/HEAD
ref: refs/heads/bevande
```

Inside it, the line **ref: refs/heads/bevande** tells us that **HEAD** points to the **bevande** branch; a small difference from branch files then, which as we saw earlier contain instead the hash of the commit they point to.

### A check

Let us now do a short test to fix the concepts just seen; let us try going back to the **master** branch and make a further commit to see what happens:

```
[23] /home/es03 (bevande)
$ git checkout master
Switched to branch 'master'
[24] /home/es03 (master)
$ echo "Crackers" >> snack.txt
[25] /home/es03 (master)
$ git add snack.txt
[26] /home/es03 (master)
$ git log --graph --decorate --oneline
* 87cacc7 (HEAD -> master) Aggiunge una matita
* 6cf12f4 Aggiunge una penna alla lista della cancelleria
```

OK, all clear so far: we went back to **master** using the **checkout** command, and we can observe how the **HEAD reference** has "**followed**" us, now pointing in fact to the **master** branch.

Let us now try to make a commit:

```
[27] /home/es03 (master)
$ git commit -m "Aggiunge lista snack a disposizione per l'ufficio"
[master e29f5c6] Aggiunge lista snack a disposizione per l'ufficio
1 file changed, 1 insertion(+)
create mode 100644 snack.txt
```

We created a new file, **snack.txt**, and added it to the **master** branch of our repository with the usual **commit** command; let us see what the log says, but this time let us add a further option, **--all**, which lets us see the **whole** structure of the repository and not just that of the current branch:

```
[28] /home/es03 (master)
$ git log --graph --decorate --oneline --all
* e29f5c6 (HEAD -> master) Aggiunge lista snack a disposizione per l'ufficio
| * 4072e76 (bevande) Aggiunge l'acqua alle bibite
|/
* 87cacc7 Aggiunge una matita
* 6cf12f4 Aggiunge una penna alla lista della cancelleria
```

A-ha! Now you can clearly see what is happening: the **master** and **bevande** branches are taking different paths; on **bevande** there is a commit (the **4072e76**) that is not on **master**, and on **master** there is a commit (the **e29f5c6**) that is not present on **bevande**.

We now have two distinct branches, with different histories, and we know how to move from one branch to another using the **checkout** command.

### One last detail

Let us go back to the **bevande** branch and see one more thing before closing:

```
[29] /home/es03 (master)
$ git checkout bevande
Switched to branch 'bevande'
[30] /home/es03 (bevande)
$ ll
total 10
drwxr-xr-x 1 san 1049089 0 Jun 29 06:44 ./
drwxr-xr-x 1 san 1049089 0 Jun 28 21:11 ../
drwxr-xr-x 1 san 1049089 0 Jun 29 06:44 .git/
-rw-r--r-- 1 san 1049089 7 Jun 29 06:44 bibite.txt
-rw-r--r-- 1 san 1049089 13 Jun 28 21:32 cancelleria.txt
```

If we go back to the **bevande** branch and look at which files are in our directory, we notice that the **snack.txt** file committed on the **master** branch disappears, and only **cancelleria.txt** and **bibite.txt** remain: the first was already on **master**, the second was born on the **bevande** branch. If we go back to **master**, the **snack.txt** file magically reappears, while the **bibite.txt** file present only on the **bevande** branch disappears:

```
[31] /home/es03 (bevande)
$ git checkout -
Switched to branch 'master'
[32] /home/es03 (master)
$ ll
total 10
drwxr-xr-x 1 san 1049089 0 Jun 29 06:46 ./
drwxr-xr-x 1 san 1049089 0 Jun 28 21:11 ../
drwxr-xr-x 1 san 1049089 0 Jun 29 06:46 .git/
-rw-r--r-- 1 san 1049089 13 Jun 28 21:32 cancelleria.txt
-rw-r--r-- 1 san 1049089 10 Jun 29 06:46 snack.txt
```

As you can see, the **bibite.txt** file present on the **bevande** branch is no longer there now that we are on **master**. You will have noticed the **git checkout -** command; as in several other commands on Unix-like systems, e.g. **cd**, in the **git checkout** command too the **dash** can be used to say "go back to where I was before", a very handy trick to save time when switching often from one branch to another.

One last thing should be highlighted; as our position changes from one branch to another, the content of Git's **working copy**, that is, our folder on disk, **changes**: the **checkout** command in fact does nothing but go and pick up all the files present on the branch we are moving to, remove those that are not there, and change the pointing of **HEAD** from the previous branch to the current one.

## Conclusions

We will need at least one more instalment to dig into this; moving between the branches of a repository is not hard, you have seen it, but in Git you can perform far more sophisticated operations once you have learned this organisational model.

Our goal will be precisely that, in order to gain the mastery needed to create branches starting from any commit, to bring a commit from one branch to another, to merge branches and even to rewrite the history of our repository, by merging, deleting or modifying existing commits.

## 2026 note

The model of branches as moving labels has not changed: `refs/heads` holds one file per branch, `HEAD` holds `ref: refs/heads/<name>`. Three things to know if you are following the examples today:

- The initial branch is no longer called `master`, but `main`.
- `git checkout <branch>` still works, but the dedicated command to switch branch today is `git switch <branch>`. `git switch -` also goes back to the previous branch, like the dash in `checkout`.
- `git log --graph --decorate --oneline --all` is still the quickest way to see the shape of a repository from the terminal. To know which branch you are on, today there is also `git branch --show-current`.
