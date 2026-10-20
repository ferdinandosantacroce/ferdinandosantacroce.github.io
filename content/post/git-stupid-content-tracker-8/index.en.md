---
title: "Git, the stupid content tracker (part 8)"
description: "Reset, reflog and reachability: how to undo a commit, find it again and work in detached HEAD without losing anything."
slug: git-stupid-content-tracker-8
date: 2017-10-15
lastmod: 2026-10-20
categories:
    - Software
tags:
    - git
    - version control
series: "Git, the stupid content tracker"
part: 8
source: https://mokabyte.it/2017/10/15/git-8/
source_date: 2017-10-15
---

*Part eight of the series, first published on [MokaByte](https://mokabyte.it/2017/10/15/git-8/) on 15 October 2017. The text stays as I wrote it then, with a note at the end about what changed.*

## Reachability and undoing commits

In the last instalment we started getting comfortable with **branches**; let us pick up the thread by checking the current branches in our **repository**. To see all local **branches**, the command to run is simply **git branch**:

```
[1] ~/es03 (master)
 $ git branch
 bevande
 * master
```

Git shows us the various **branches** present, highlighting with an **asterisk** and in **green** the **branch** we are currently on.

### git log

A way to get a more detailed view is to use the git log command, with the options we already saw in the previous article:

```
[2] ~/es03 (master)
 $ git log --graph --decorate --oneline --all
 * e29f5c6 (HEAD -> master) Aggiunge lista snack a disposizione per l'ufficio
 | * 4072e76 (bevande) Aggiunge l'acqua alle bibite
 |/
 * 87cacc7 Aggiunge una matita
 * 6cf12f4 Aggiunge una penna alla lista della cancelleria
```

As a pretext to continue our exploration, let us suppose we made this mistake: we added the **snack** list to the **master** branch, which instead only contained stationery; we therefore want to **undo** that commit. Can it be done? And if so, how?

## The git reset command

In Git this is very possible, and also quite simple. We need to use the **git reset** command, analysing its behaviour. The **git** **reset** command lets us move **HEAD**, that pointer, that "little flag" indicating the commit we are currently on.

To go back to our case, we can therefore use the **git** **reset** command to move **HEAD** from the last commit made on master (e29f5c6) to the one before it; to do this we use the system Git provides for referring to **past** **commits**.

## References to the past

In Git you often need to refer to a **commit** **made** **in** **the** **past**, for example as in this case; for this purpose we can use the **HEAD** reference followed by one of two special characters, **tilde ~** and **caret ^**.

Using **one** **caret** basically means "one step back", while using **two** means two steps back and so on. If you want to go back several steps, typing dozens of carets would not be very convenient; that is why, when you need to go back a long way, you can use the **tilde**: likewise, **~1** means "one step back", while **~25** means twenty-five steps back and so on.

Particular needs can make the use of these two operators complex; in the [Git revisions documentation](https://git-scm.com/docs/gitrevisions) you will find the details. As far as we are concerned, what we have just learned is enough to continue; so let us move to action and try to go back one commit on the **master** branch using the **caret**:

```
[3] ~/es03 (master)
 $ git reset --hard HEAD^
 HEAD is now at 87cacc7 Aggiunge una matita
[4] ~/es03 (master)
 $ git log --graph --decorate --oneline --all
 * 4072e76 (bevande) Aggiunge l'acqua alle bibite
 * 87cacc7 (HEAD -> master) Aggiunge una matita
 * 6cf12f4 Aggiunge una penna alla lista della cancelleria
```

As you will have noticed, **HEAD** is now on the commit that until a moment ago was the second to last; the one that was last, the "snacks" commit, has disappeared. Do not worry about the **--hard** option; we will see what it means later.

### Moving or resetting?

But then does this **git** **reset** command actually "reset" commits? Does it delete them? **Not** exactly; **git** **reset** moves **HEAD**, and incidentally this can cause side effects. Do you remember the story about leaves? It said that a **commit**, to be reachable, must be marked by a **label**, by a **branch**, directly or indirectly. If neither it nor any of its "descendant" commits is marked by a branch, that commit becomes "unreachable", and consequently no longer appears when, for example, we run **git** **log**. But this does not mean it has disappeared.

### Recovering a reset commit

Let us go on with our story on the repository, and now suppose we realised that, after all, we did need that snacks commit: is there a way to get it back? Certainly!

Still using the **git** **reset** command, we can move **HEAD** back onto that commit, "resurrecting" it. Since that commit is not referenced by any **branch**, however, the only way to recover it is to know its **hash**, or at least the first characters of it.

In this case we are lucky: if you have not closed the Git shell in the meantime, a scroll upwards will very likely show you the previous **git** **log** command run while it was still visible. But what if the shell had been closed? How do we find the hash of the commit?

## Reflogs

Git never stops surprising us; among its many commands and features, there is room for **reflogs**. **Reflogs** are essentially **log** files where Git **notes** every **movement** made on **references**, indicating for each one the command that caused it; let us take a look at the reflog of **HEAD**:

```
[5] ~/es03 (master)
 $ git reflog
 87cacc7 HEAD@{0}: reset: moving to HEAD^
 e29f5c6 HEAD@{1}: checkout: moving from bevande to master
 4072e76 HEAD@{2}: checkout: moving from master to bevande
 e29f5c6 HEAD@{3}: checkout: moving from bevande to master
 4072e76 HEAD@{4}: checkout: moving from master to bevande
 e29f5c6 HEAD@{5}: commit: Aggiunge lista snack a disposizione per l'ufficio
 87cacc7 HEAD@{6}: checkout: moving from bevande to master
 4072e76 HEAD@{7}: commit: Aggiunge l'acqua alle bibite
 87cacc7 HEAD@{8}: checkout: moving from master to bevande
 87cacc7 HEAD@{9}: commit: Aggiunge una matita
 6cf12f4 HEAD@{10}: commit (initial): Aggiunge una penna alla lista della cancelleria
```

The **reflog** command can optionally receive the name of a **reference**, that is, of the **branch** whose movements you want to see; if nothing is given, the default shows the movements of **HEAD**. Also, be warned that your result may differ from mine, but that is normal: I may have made some extra movements while running the tests for this article.

### Analysing the movements

But now let us analyse the output of this command a little: as you can see, all the movements made by **HEAD** up to now are present, in reverse chronological order: **HEAD@{0}** is in fact the last movement made, performed with **git reset HEAD^**.

If we scroll a little down the list, we will see that six movements earlier, at **HEAD@{5}**, a movement due to a **commit** is logged, and from the comment we understand it is the one about snacks, the one we care about; at this point we can note the **hash** we read to its left and move on to the next step, "in search of the lost commit".

So let us run a reset using the hash as the destination of the movement:

```
[6] ~/es03 (master)
 $ git reset --hard e29f5c6
 HEAD is now at e29f5c6 Aggiunge lista snack a disposizione per l'ufficio
[7] ~/es03 (master)
 $ git log --graph --decorate --oneline --all
 * e29f5c6 (HEAD -> master) Aggiunge lista snack a disposizione per l'ufficio
 | * 4072e76 (bevande) Aggiunge l'acqua alle bibite
 |/
 * 87cacc7 Aggiunge una matita
 * 6cf12f4 Aggiunge una penna alla lista della cancelleria
```

Boom! The lost **commit** is "resurrected", and it is back exactly where it was before! To be honest it never left, but as we said earlier, it had simply become unreachable, or ***unreachable*** as Git usually calls this kind of **commit**.

This simple example gave us a chance to observe Git's internal architecture, and the objects that make up a **repository**, from another angle. At this point it should be a little clearer how Git manages the **relationships** between **commits**, and how these can disappear and reappear by moving a **branch** from one **commit** to another.

## When Git loses its head

Since the topic is quite peculiar, and since we are stubborn, let us make a mess again to see another way out. Let us undo this snacks **commit** again, using the usual **git** **reset** command:

```
[8] ~/es03 (master)
 $ git reset --hard HEAD^
 HEAD is now at 87cacc7 Aggiunge una matita
[9] ~/es03 (master)
 $ git log --graph --decorate --oneline --all
 * 4072e76 (bevande) Aggiunge l'acqua alle bibite
 * 87cacc7 (HEAD -> master) Aggiunge una matita
 * 6cf12f4 Aggiunge una penna alla lista della cancelleria
```

Good, now let us try to move HEAD onto this commit; let us no longer use the **git** **reset** command, which as we have seen moves the current branch label, but the **git** **checkout** command, which instead moves the **HEAD** reference from where it is now, that is, the master branch, directly onto a commit, referencing it directly through its **hash**:

```
[10] ~/es03 (master)
 $ git checkout e29f5c6
 Note: checking out 'e29f5c6'.
You are in 'detached HEAD' state. You can look around, make experimental
 changes and commit them, and you can discard any commits you make in this
 state without impacting any branches by performing another checkout.
If you want to create a new branch to retain commits you create, you may
 do so (now or later) by using -b with the checkout command again. Example:
 git checkout -b <new-branch-name>
HEAD is now at e29f5c6... Aggiunge lista snack a disposizione per l'ufficio
```

Wow, we have just lost… our **head**!

### What happened to HEAD?

There are a lot of new things to see here; but do not be afraid, it is not complicated: let us read the long message Git showed us step by step.

First, though, let us stop for a second to think: Git is kind, and often gives us a lot of useful **information** in its output messages. Do not underestimate this behaviour, and above all **do** **not** **ignore** the **messages**: especially at the beginning, reading Git's messages carefully lets you learn a lot.

Back to the message: here Git says we are in a ***detached HEAD*** state, or "detached head". It sounds like something bad, bordering on horror, but fortunately there are no vengeful ghosts to fear here; simply, being in this state means **HEAD** does not refer to a branch, but directly to a **commit**, which in this case is **e29f5c6**.

Let us take a look with the usual log command:

```
[11] ~/es03 ((e29f5c6...))
 $ git log --graph --decorate --oneline --all
 * e29f5c6 (HEAD) Aggiunge lista snack a disposizione per l'ufficio
 | * 4072e76 (bevande) Aggiunge l'acqua alle bibite
 |/
 * 87cacc7 (master) Aggiunge una matita
 * 6cf12f4 Aggiunge una penna alla lista della cancelleria
```

First of all, in the shell prompt you can see that between the brackets, which are now doubled, there is **no** **branch** **name**, but instead the **first** **7** **characters** of the **commit**, **((e29f5c6…))**. In addition, the **HEAD** label is now stuck to that commit, while the **branches**, especially **master**, stay where they are. Consequently the **HEAD** file now contains the **hash** of that commit, and not a reference to a **branch** as before; let us peek inside the **HEAD** file:

```
[12] ~/es03 ((e29f5c6...))
 $ cat .git/HEAD
 e29f5c64d23f8aa0c6613fcf43e418df4ae286ad
```

As you can see, there is the **hash** of the snacks **commit**.

Let us go on reading the message; Git says that in this state we can look around, experiment, make new commits if we want, and throw it all away simply by moving back onto an existing branch, or save the work done by creating a new **branch**. Are you able to explain why this is true? I believe you are now, but in doubt, let us review it together.

## Reachability

This is possible thanks to the **reachability** system of **commits**, of course. If we make some commits, and then move **HEAD** back onto an existing **branch**, this snacks **commit** and all its children become unreachable.

They remain reachable as long as **HEAD** is on top of the last of them, but when **HEAD** moves with a **git** **checkout**, the child commits are gone. At the same time, if a new branch is created before moving **HEAD**, there will be a label, a **pointer** Git can use to reach these commits.

### A bit more damage

Shall we try? Sure, come on. Let us do a bit more damage: let us overwrite the stationery file with something else, and then make a commit:

```
[13] ~/es03 ((e29f5c6...))
 $ echo "Bug!" > cancelleria.txt
[14] ~/es03 ((e29f5c6...))
 $ git commit -am "Un bug ha cancellato la lista della cancelleria!"
 [detached HEAD 37ddfbd] Un bug ha cancellato la lista della cancelleria!
 1 file changed, 1 insertion(+), 2 deletions(-)
[15] ~/es03 ((37ddfbd...))
 $ git log --graph --decorate --oneline --all
 * 37ddfbd (HEAD) Un bug ha cancellato la lista della cancelleria!
 * e29f5c6 Aggiunge lista snack a disposizione per l'ufficio
 | * 4072e76 (bevande) Aggiunge l'acqua alle bibite
 |/
 * 87cacc7 Aggiunge una matita
 * 6cf12f4 Aggiunge una penna alla lista della cancelleria
```

Interesting! Now we have a new **commit**, **37ddfbd**, after the snacks one **e29f5c6**, and no other pointer to it except **HEAD**.

Let us now test the first hypothesis: let us move to **master** and see whether these two **commits** disappear from our view again:

```
[16] ~/es03 ((37ddfbd...))
 $ git checkout master
 Warning: you are leaving 2 commits behind, not connected to
 any of your branches:
 37ddfbd Un bug ha cancellato la lista della cancelleria!
 e29f5c6 Aggiunge lista snack a disposizione per l'ufficio
If you want to keep them by creating a new branch, this may be a good time
 to do so with:
 git branch <new-branch-name> 37ddfbd
Switched to branch 'master'
[17] ~/es03 (master)
 $ git log --graph --decorate --oneline --all
 * 4072e76 (bevande) Aggiunge l'acqua alle bibite
 * 87cacc7 (HEAD -> master) Aggiunge una matita
 * 6cf12f4 Aggiunge una penna alla lista della cancelleria
```

Exactly so!

But before going on, let us stop again to read Git's message in reply to our **git** **checkout**. As you can see, Git reminds us that with this operation we are in fact leaving 2 commits behind and that, if we want to keep them, we must create a **new** **branch** that **points** to the **last** **commit** made, even suggesting the command.

Let us follow its advice and create a new branch named "snack":

```
[18] ~/es03 (master)
 $ git branch snack 37ddfbd
[19] ~/es03 (master)
 $ git log --graph --decorate --oneline --all
 * 37ddfbd (snack) Un bug ha cancellato la lista della cancelleria!
 * e29f5c6 Aggiunge lista snack a disposizione per l'ufficio
 | * 4072e76 (bevande) Aggiunge l'acqua alle bibite
 |/
 * 87cacc7 (HEAD -> master) Aggiunge una matita
 * 6cf12f4 Aggiunge una penna alla lista della cancelleria
```

Let us move to the branch just created:

```
[20] ~/es03 (master)
 $ git checkout snack
 Switched to branch 'snack'
```

Now let us discard the last **commit**, the one with the bug:

```
[21] ~/es03 (snack)
 $ git reset --hard HEAD~1
 HEAD is now at e29f5c6 Aggiunge lista snack a disposizione per l'ufficio
[22] ~/es03 (snack)
 $ git log --graph --decorate --oneline --all
 * e29f5c6 (HEAD -> snack) Aggiunge lista snack a disposizione per l'ufficio
 | * 4072e76 (bevande) Aggiunge l'acqua alle bibite
 |/
 * 87cacc7 Aggiunge una matita
 * 6cf12f4 Aggiunge una penna alla lista della cancelleria
```

Very good! Not only did we recover the snacks **commit**, but we have now moved it to a **separate** **branch**, removing it from the **master** branch, which we will keep for stationery.

## Conclusions

In this instalment we discovered new things about Git references and about commit reachability; using **git** **reset** we saw how it is possible to move the labels that denote branches, taking advantage of some side effects such as the (apparent) deletion of **commits**.

Using **git** **checkout** differently, on the other hand, we met the **detached HEAD** state, which lets us work in a sort of "protected zone" where we can make **commits** and then keep or discard them as we please.

In the next instalments we will keep working with **references** and **branches**, until we reach the point where nothing is a secret any more.

## 2026 note

The mechanism of `reset`, `reflog` and `detached HEAD` is identical. Three things to know if you are following the examples today:

- The initial branch is no longer called `master`, but `main`, and `git switch <branch>` is the dedicated command to change branch. `git checkout <hash>` to look at a commit is still valid.
- The reflog is not forever: Git keeps entries for 90 days and deletes unreachable commits after about two weeks with garbage collection. The recovery you read about here works if you notice in time. `git reflog` is the first command to try when you think you have lost a commit.
- `git reset --hard` also throws away uncommitted changes. Before using it, run `git status` and, if in doubt, `git stash`.
