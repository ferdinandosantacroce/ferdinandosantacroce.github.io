---
title: "Git, the stupid content tracker"
description: "The story of Git: from the Linux kernel to BitKeeper, and why the name is a joke. Part one of the series."
slug: git-stupid-content-tracker-1
date: 2016-09-12
lastmod: 2026-10-20
categories:
    - Software
tags:
    - git
    - version control
    - open source
series: "Git, the stupid content tracker"
part: 1
source: https://mokabyte.it/2016/09/12/git-1/
source_date: 2016-09-12
---

*Part one of the series "Git, the stupid content tracker", written between 2016 and 2018 and first published on [MokaByte](https://mokabyte.it/2016/09/12/git-1/) on 12 September 2016. The text is the original one, with a note at the end where time has changed things.*

## Introduction

**Git** is one of the best known and most used tools among software developers, and rightly so: it is a genuinely important help when it comes to managing code development in a distributed and collaborative way.

Over the series we will look at several practical aspects of **Git**, but in this first article we will deal with some "side" matters that still matter, because they help explain certain choices and certain traits of the product. In particular we will focus on the **history** of Git, presenting some facts that are probably unknown to most people who use Git, maybe on a daily basis.

### The name Git

First of all, let us try to understand what "Git" means. And the best way to start is to quote the words of the father of **Git**, **Linus** **Torvalds**.

> Q: Why was the name "Git" chosen?
>
> A: I'm an egotistical bastard, and I name all my projects after myself: first "Linux", now "Git".

The joke lies in the fact that **git**, in British slang, identifies a quarrelsome person who always wants to be right. As explained in the software's [FAQ](https://git-scm.com/docs/gitfaq), the name "Git" can also have several other meanings, "depending on your mood…". First of all, it is a combination of three letters, easy to pronounce and not used by UNIX commands. Then there is the fact that the pronunciation can resemble "get". It can stand for **Global Information Tracker**, but also for other, less friendly combinations of words, in case it does not work… and so on.

Anyone who knows **Linus** **Torvalds** knows this is his style: direct, brilliant and often disrespectful; given the results, I would say we can forgive him everything… or almost.

## In the beginning was BitKeeper

The first version of **Git** saw the light in **April** **2005**. Linus Torvalds, as everyone knows, is the father of the **Linux kernel**, a project where he still plays the role of "benevolent dictator". That project consists of **a few million** **lines** of **code**; dealing with such an amount of data makes it easy to understand how important a **precise** and **efficient** **versioning** **system** can be.

### The first DVCS

Before **Git** came along, that role was filled by [**BitKeeper**](https://en.wikipedia.org/wiki/BitKeeper), a **proprietary** **Distributed Version Control System** (DVCS) developed by BitMover Inc.; the company was led by Larry McVoy, the creator of what we can call the first DVCS in history.

Legend has it that in 1998 McVoy himself offered his product to the Linux kernel developers, writing a post on the **Linux Kernel Mailing List** where he said he had "a solution to the growing pains" the penguin project was suffering from.

At the time Linus was busy reviewing and integrating **manually** all the changes proposed for the kernel, changes that reached him by email in the form of patches.

What had been a mere side project of a Finnish university student had by then become a product relied on by individuals and companies alike, and the expectation in terms of quality and number of features kept growing day by day.

In that post McVoy invited people to think about one point: there is only one Linus, and we cannot have more than one. What can be done to improve the situation is to try to **distribute** the **integration** **work** across more people, offering a **tool** powerful and effective enough that **no** **mistakes** are **made** and nobody's work is wasted.

Even though the offer was tempting, and the product was **promising** and **mature** enough for the job it was proposed for, the offer was **not** **accepted** before 2002, and not without dissenting voices; no surprise, then, that the collaboration lasted only three years.

### Licensing problems and reverse engineering

In 2005, in fact, **relations** **broke** irretrievably. Larry McVoy accused Andrew Tridgell, a **Linux contributor** and a leading figure in the **FLOSS** world, of running a **reverse**-**engineering** project on the **BitKeeper** code, thus violating the agreements in place. Tridgell, who claimed he had never personally accepted any licence, said he had done nothing but listen on the **BitKeeper** communication channel, analysing its protocol for "ethical" purposes, as he had already done with **Samba**.

McVoy did not like this at all; the **free** **licence** granted to the **kernel** developers contained several **explicit** **clauses** aimed at protecting its architecture as much as possible. Besides **not** allowing **reverse-engineering**, rather obvious for a **commercial** product, the licence **forbade**, for example, its **use** by anyone **contributing** to the **development** of **other** **versioning** **systems**.

It even banned its use by anyone collaborating with the **Open Source Development Labs** ([OSDL](https://en.wikipedia.org/wiki/Open_Source_Development_Labs)); among those collaborators, the most famous was certainly Andrew Morton, Linus's right-hand man.

So **McVoy** decided to **revoke** **forever**, for everyone, the free **licence** to use **BitKeeper**: from then on, anyone who wanted to use BitKeeper would have to pay.

### Crisis as an opportunity

And so, overnight, the most famous open source project in history found itself **without** a **source** **code** **management** **system**.

In the Linux working group, however, there were those who did not see the event as a tragedy at all; on the contrary, they probably greeted it as a deliverance. Reasons for disliking the adoption of BitKeeper, ultimately a proprietary product, had been there from the start, and for many people this break was certainly a positive event, a **liberation** from the strict rules imposed by McVoy.

Among those happy about the break were certainly **Richard Stallman** and **Alan Cox**, leading figures in the **FLOSS** world. They had raised doubts from the very beginning, mainly because they considered the use of **proprietary** software for developing free code **inappropriate**; **Cox**, for example, despite being one of the major contributors to the **Linux** **kernel**, **never** wanted **BitKeeper** and **never** **used** it, but in practice forced McVoy to build **interoperability** tools with **CVS** and **Subversion** so that the Linux code could be accessed using open source tools.

And so, in the year 2005, the search for an **alternative** began.

## Goodbye BitKeeper, welcome Git

We have seen how, at a certain point, the project found itself looking for **another** **tool** able to support the development of the **Linux** **kernel**. Alternatives at the time were certainly **not** missing; the **open** **source** world already offered several source code **versioning** tools. Among them was [**Concurrent Versions System** (CVS)](https://en.wikipedia.org/wiki/Concurrent_Versions_System), one of the most "ancient" versioning systems.

### Distrust of CVS and Subversion

Torvalds, however, did not think highly of **CVS**; when he later decided what the **three focal points** for developing **Git** should be, he started with this one:

> Take Concurrent Versions System (CVS) as an example of what not to do; if in doubt, make the exact opposite decision.

As this statement shows, despite its long history (the first version of CVS dates back to 1990), this tool never won Linus's favour. In a [famous talk from 2007](https://www.youtube.com/watch?v=4XpnKHJAok8), Linus recalls how, during the early years of Linux kernel development, people simply exchanged **tarballs** and **patches**, calling them "a management system better than CVS"…

Linus, as everyone knows, does not mince words; but when he attacks something, or someone, he almost never does it out of prejudice. Linus used CVS for years in his daily work, and that, by his own admission, is what led him to "hate" poor CVS with a passion.

Someone is now wondering what Linus might think of [**Subversion**](https://en.wikipedia.org/wiki/Subversion), which at the time already had five years of history behind it… well, do not expect better judgement. **Subversion**, according to Linus, was "the most pointless project ever started", and that because of its own tagline, which calls it "CVS done right". "There is no way to do CVS right!" is the blunt verdict of the famous Finnish hacker.

### Distributed workflow and Monotone

Folklore aside, these systems did not meet another requirement Linus had set: the **distributed** **workflow**, which BitKeeper had in fact invented. The only one was [**Monotone**](https://en.wikipedia.org/wiki/Monotone_(software)), one of the first open source **DVCS** to appear on the market. Note that both [**Bazaar**](https://en.wikipedia.org/wiki/GNU_Bazaar) and [**Mercurial**](https://en.wikipedia.org/wiki/Mercurial) are practically Git's twins, since development of both began in the spring of 2005.

**Monotone** was at the time the only one respecting the required **commit** **atomicity** and **workflow** constraints; despite this, it never managed to win the favour of Linux's lord and master. Monotone's problem was its **slowness**; in his experiments, Linus took almost two hours to import a single revision of the Linux kernel. **Monotone** is written in C++ and uses a real database to index data; Linus, as it happens, has never been a fan of either technological choice. In his own words:

> If you want a VCS written in C++, use Monotone. Really. It uses a "real database". It uses "good OO libraries". It uses "good C++ abstractions". But, frankly, with all those design decisions that look so attractive to some computer science experts, the end result is a horrible mess that is impossible to maintain.

### The need for a new DVCS

So the decision was made to create a **DVCS** from scratch that would meet the **safety**, **speed** and **reliability** requirements needed to develop a project like the **Linux** **kernel**.

The first line of **Git** code was written on 6 April **2005**; development moved very fast, so much so that by 18 April the **multiple** **merge** feature was already there. Two months later, on 16 June 2005, **Linux** **kernel** version 2.6.12 was already managed with **Git**.

After making the tool usable enough, by people of his own technical stature, on 26 July Linus decided to put the project into maintenance, that is to hand the sceptre of "master builder" to someone who could take care of its development from then on.

That person is Junio Hamano.

## Where things stand

When we talk about **Git** we often talk about Linus Torvalds; many forget that Linus was "only" the one who lit the fuse; after a handful of weeks spent writing a first implementation and dictating the design of each feature, the project was handed to Junio Hamano, one of the early contributors and, by Torvalds's own account, the most active one.

**Version 1.0 of Git**, in fact, was born at the hands of Junio himself, who has kept guiding its development ever since. He made it truly usable by the general public, and it is thanks to him that today every "mere mortal" can use it knowingly.

At the time of writing, [**Git**](https://git-scm.com/) had reached **version 2.10**.

Thanks to the work of many, over the years **Git** has earned a place of honour in the DVCS market, becoming its undisputed king despite the crowded competition. Without the slightest claim to do so, it then made possible the birth of a market that did not exist before, namely the one of **service** **providers** built around it: companies like **GitHub**, like **Atlassian** with **BitBucket**, or like **GitLab** now move millions of dollars, thanks to a tool sketched out in a couple of months to solve a strictly personal problem.

## Conclusions

We wanted to tell the story of Git, so that it may be an example for those who believe success always requires big ideas or investors: what matters is to **identify** a **problem** and **offer** a **solution**, the **best** possible one.

Ah, one last note: **BitKeeper** became [open source](https://www.bitkeeper.org/) in May of this year…

## 2026 note

The text is from 2016 and the history does not change, but three things have aged:

- Git is no longer at 2.10: in 2026 it has gone past 2.50. The rest of the story, from the first line of code to the handover to Junio Hamano, is identical.
- "May of this year" meant May 2016. BitKeeper has been open source since then.
- The numbered references to notes and external articles no longer resolve: in their place there are stable links, where they exist.
