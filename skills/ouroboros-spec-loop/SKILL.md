---
name: ouroboros-spec-loop
description: Specification-first workflow for turning vague ideas into stable execution seeds before coding. Use when a task is large, ambiguous, strategic, product-shaped, or likely to fail because the goal, constraints, success criteria, domain model, or evaluation method are unclear.
---

# Ouroboros Spec Loop

Use this skill as a router over the imported Ouroboros skills when the hard part is deciding what should be built. It turns vague intent into an execution-ready seed and stops there. Execution is a separate decision made by the user.

## Core Rule

Do not start execution. This skill covers planning only: Interview and Seed. When the Seed is complete, stop and ask the user whether to proceed.

## Scope

```text
Interview -> Seed -> [Handoff to user]
```

Ouroboros execution (`ouroboros-run`, `ouroboros-evaluate`, `ouroboros-evolve`) is outside this skill's scope. Those run only if the user explicitly continues after the handoff.

### 1. Interview

Use `ouroboros-interview` when a full interview is needed.

Ask Socratic questions that expose hidden assumptions:

- What is the real goal?
- Who is affected?
- What constraints matter?
- What would make the result clearly good or clearly wrong?
- What existing system, vocabulary, or decision history must be respected?
- What should not be changed?

Keep the interview proportional. A small feature may need three questions; a strategic system may need a full brief.

### 2. Seed

Use `ouroboros-seed` when requirements should become a formal Seed.

Turn the answers into a compact execution seed:

- goal,
- non-goals,
- constraints,
- domain terms,
- success criteria,
- risks,
- required checks,
- next action.

If the seed still has high ambiguity, continue interviewing instead of pretending it is ready.

### 3. Handoff

When the Seed is complete, stop and ask the user:

> 계획이 완성됐습니다. 스킬을 사용해서 계획을 더 구체화할까요?

Wait for the user's response before doing anything else. Do not proceed to execution automatically.

If the user says yes, use `ouroboros-evolve` to refine the Seed further, then ask again at the next Seed checkpoint.

If the user says no or wants to proceed to implementation, hand off to `matt-engineering-workflows` with the completed Seed as context.

## Ambiguity Gate

Before execution, check four dimensions:

- Goal clarity: is the desired outcome specific?
- Constraint clarity: are limits and non-goals known?
- Success clarity: can we verify completion?
- Context clarity: do we understand the existing system enough to avoid damage?

If two or more are weak, continue specification work.

## Anti-Patterns

- Starting a large implementation from a one-line wish.
- Asking endless questions after the next action is already clear.
- Treating the first plan as permanent after evaluation reveals better information.
- Writing a huge spec when a small seed would unblock execution.

## Source

Router for skills imported or adapted from:

- https://github.com/Q00/ouroboros
