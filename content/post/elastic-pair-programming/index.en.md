---
title: Elastic Pair Programming
description: An alternative way to do pair programming
slug: elastic-pair-programming
date: 2021-04-12 00:00:00+0000
image: cover.jpg
categories:
    - Software
tags:
    - XP
weight:
---

Some time ago I spent [a wonderful evening](https://blog.adrianbolboaca.ro/2018/03/remotepairprogramming-ep-009-adi-ferdinando-elastic-pair-programming/) with [Adrian Bolboacă](https://blog.adrianbolboaca.ro/), trying for the first time in public a pair programming technique I had observed and experimented in companies where I worked.

In this post, I'll tell you about the characteristics of this approach.


## Traditional pair programming

[Pair programming](https://en.wikipedia.org/wiki/Pair_programming) is a cornerstone practice of [eXtreme Programming](https://en.wikipedia.org/wiki/Extreme_programming) (XP), and I won't go into detail explaining it. You can find a comprehensive description on the [good old C2 Wiki](https://wiki.c2.com/?PairProgramming).

There are various ways to do pair programming; in his latest book, "[Practical Remote Pair Programming](https://www.packtpub.com/product/practical-remote-pair-programming/9781800561366)," Adrian illustrates very well some of the most commonly used approaches.

Normally, pair programming practice is quite disciplined; roles are well-defined, and there are rules and timings to respect.

**Discipline is one of the strengths** of the technique, especially at the beginning of the journey toward XP.

Through this practice, continuous collaboration with colleagues is triggered, strengthening the individual's ability to understand and elaborate domain concepts.

After years of practice, a stable team reaches a high mastery of their application domain, technologies, and techniques adopted by the team.

At that point, **"classic" pair programming often ends up feeling restrictive**, and it's in these occasions that it's possible to loosen the rules a bit and move to a more elastic working mode.


## Elastic pair programming

The name "_elastic pair programming_" came as a bit of a surprise; before discussing with Adi, I had never thought of this approach as something defined, to which I could give a name.

Despite this, I'd say the definition well represents the main characteristic of the approach, namely the elasticity of rules and roles.

To tell the truth, there's only one rule: **ideas (and keyboard) are exchanged continuously**.

I found this way of working very effective in different situations.

The most classic is when there are two people at the keyboard who have known each other for a long time, both experienced professionals.

They don't necessarily have to be experts in the same domain or the same techniques; in fact, I've often found it interesting to encourage confrontation between different points of view.

The idea is that, faced with a thorny or peculiar problem, an expert developer calls upon a peer to **share and possibly refute the solution hypothesis**, and perhaps arrive at a better or unexpected solution for both.

I've often used this technique in "on-demand" mode, involving colleagues who don't normally pair program with me or in teams where the practice wasn't customary.

**The practice is also interesting for "unblocking" colleagues who are skeptical** about pair programming.

It happened to me to be welcomed into a team of only seniors, all very skilled in the application domain, where everyone developed quite independently from others.

I needed to learn quickly, so I tried to introduce pair programming practice in the team to encourage sharing opportunities; although colleagues were available, their impatience with the rules imposed by the practice was quite evident to me.

At that point, when I understood that the pair programming experiment would inevitably fail, I looked for approaches and solutions to not lose the opportunities for confrontation, so useful for me (but ultimately for the entire team).

In this situation, we therefore relaxed the rules, allowing ourselves to take the keyboard at any moment to intervene.

Tests, implementations, and solutions then began to emerge more easily, and so did discussions about language details, patterns, or different approaches that each of us, through experience, had accumulated over the years.

In this situation, I still managed to obtain the benefits of knowledge sharing, very important for me, giving up the "side-effect" (which I still appreciate) of discipline and cadence that traditional pair programming provides.

Another situation I remember well was what happened [when I worked with my colleagues](https://www.intre.it/camp-2/) in guilds.

[Guilds](https://www.intre.it/gilde/) are a very powerful tool that the company made available to us for learning, growing, and improving our capabilities.

In guilds, ad-hoc teams work on a project proposed and chosen by them, with the aim of exploring new technologies or approaches.

In situations like these, very relaxed and open to confrontation, we found benefit in working using this elastic style of pair programming, and it was then quite natural for us to evolve to what is now commonly referred to as [ensemble (Mob) programming](https://en.wikipedia.org/wiki/Mob_programming).


## Pitfalls

This technique has only one rule, but you need to be careful: **it's precisely when there are few rules that it's easier to make mistakes**.

This approach can easily become a system for not doing pair programming; having no "obligations," it's easy to fall into the anti-pattern where the driver writes code and works alone, while the navigator thinks about something else...

![Extreme Programming according to Dilbert](dilbert-extreme-programming.png)

In this situation, it's better to go back to working individually and perhaps reflect at the team level on what prevents this kind of collaboration and what alternatives we have to continue maintaining a high flow of information between people.

**Even in elastic pair programming mode, working agreements are established**, including for example keeping smartphones and distractions away.

On some occasions, I've worked in pairs with a second computer in addition to the main one, a bit like what's also allowed in ensemble programming. The secondary computer is for support: the navigator can use it, for example, to search for something online while the driver remains focused on the code, certainly not to mind their own business. The goal always remains to write code and solve problems together.

Another recommendation is not to use this technique without experience in traditional pair programming, or between two people who are both not well-versed in technique and/or domain. In this case, you easily risk losing your bearings and foundering.

As a famous Italian commercial said a few years ago, elastic pair programming is [for many, but not for everyone](https://www.youtube.com/watch?v=vJ1wwYCGkIg&t=1s) 🙂

The trick I use to decide whether it's appropriate to use this approach is to ask myself a simple question: "_Could you solve this problem alone?_" If the answer is something like "_Yes, but I'm curious to know how -insert name here- would solve it_", there are the premises for a good elastic pair programming session.


## Remote elastic pair programming

The experience with Adi made me understand that this style can also work remotely.

In fact, **the continuous search for consensus and role exchange keeps people's attention high**, preventing physical distance from lowering confrontation and exchange of ideas.

For a few years now, I've stopped being a full-time programmer, although I often do my work as a coach and trainer in software development teams.

In the experiences I've gained in the last year and a half of forced remote work, I've been able to observe the effectiveness of this style, even though people were often unaware of doing this kind of pair programming 🙂


## Conclusions

I don't think I invented anything new with this technique, perhaps just gave a name to a practice that many programmers already adopt.

I hope this awareness adds one more option to your toolbox 😉