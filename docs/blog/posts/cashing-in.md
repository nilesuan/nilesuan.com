---
title: Cashing In
date: 2026-03-15
description: Building an AI-powered software engineering system with Claude Code and discovering where the real bottlenecks are.
tags:
  - ai
  - engineering
---

I started creating my own computer engineering system with Claude Code back in December of 2025. Pretty late in the game, I know, but better late than never.

I'm a very slow coder, so I needed help in that department. The whole thing started out as me wanting to replicate the whole SDLC process, from planning all the way to production deployment.

## The System

The current system now involves having a goal and a full workflow that creates draft plans, generates problems that can be encountered (usually goes from 80 to 100+ problems), works out how to solve them using industry standards, identifies gaps found in the plan, and splits the plan into epics and stories of one hour. Why one hour? Because if we want to pass a unit of work to a sub-agent with Sonnet, it has to be small enough and independent enough that Sonnet can work on it with precision.

From there it builds using all the shiny things that Claude has to offer, including multi sub-agent workflows and git worktrees as long as the plan's dependency graph allows it. Context efficiency improvements like running the sub-agents by passing files as context. Sub-agents write outputs themselves and only come back with one-liners. Making sure unit tests, integration tests, and acceptance tests are followed. The whole works, including generating runbooks and all the security things that need to be addressed, like hardening for production like horizontal scaling, and so on.

## Thinking Bigger

The more I worked on the system, the more I realised how important big-picture vision is. Instead of thinking like a single developer, thinking like a full systems engineer or architect is what's required for these AI multipliers to work. Sure, the planning phase alone burns my five-hour limit in just an hour or so, but it's very thorough.

## The Bottleneck

Then comes the biggest kicker. With all the split multi-agent and sub-agents working and pumping out code that fits the plan, the biggest bottleneck is now pull/merge requests. Development has now run at top speed, and humans having to review just isn't viable anymore. Again, we squishy humans have become the bottleneck.

## Making It Cheaper

Enter Anthropic with their $25 review skill. Pretty expensive, but it beats paying your developer $100 an hour to review, which I think is a steal. But can we make it cheaper?

Sure. I was able to ask Claude to build me a containerised bot that does the same thing using Bedrock, and it's way cheaper. It probably isn't as high-quality a review as Anthropic's, but it's a quality I myself trust enough that it even catches things I overlooked. If it reviews better than me, what's the point of me reviewing?

---

*The title is about Anthropic knowing what the bottleneck is and cashing in on it, because the future is already here, and it's expensive.*

