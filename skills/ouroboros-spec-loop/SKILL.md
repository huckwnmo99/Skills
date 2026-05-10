---
name: ouroboros-spec-loop
description: Specification-first workflow for turning vague ideas into stable execution seeds before coding. Use when a task is large, ambiguous, strategic, product-shaped, or likely to fail because the goal, constraints, success criteria, domain model, or evaluation method are unclear.
---

# Ouroboros Spec Loop

Use this skill before implementation when the hard part is deciding what should be built. It turns vague intent into an execution-ready seed, then feeds evaluation results back into the next pass.

## Core Rule

Do not start major execution until the goal, constraints, success criteria, and relevant context are clear enough to verify.

## Loop

```text
Interview -> Seed -> Execute -> Evaluate -> Evolve
```

### 1. Interview

Ask Socratic questions that expose hidden assumptions:

- What is the real goal?
- Who is affected?
- What constraints matter?
- What would make the result clearly good or clearly wrong?
- What existing system, vocabulary, or decision history must be respected?
- What should not be changed?

Keep the interview proportional. A small feature may need three questions; a strategic system may need a full brief.

### 2. Seed

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

### 3. Execute

Execute through the smallest suitable workflow:

- use `matt-engineering-workflows` for development loops,
- use `workflow-ledger` for persistent task memory,
- use `karpathy-guidelines` for coding behavior,
- use `codex-harness-adapter` when multiple workflows need routing.

### 4. Evaluate

Evaluate with layered checks:

- mechanical: tests, typecheck, lint, build, scripts, screenshots, or concrete commands,
- semantic: does the output satisfy the seed and domain intent?
- consensus or review: use another reviewer, agent, or human when stakes are high.

### 5. Evolve

Feed the evaluation back into the next seed:

- what changed,
- what became clearer,
- what failed,
- what should be tried next,
- whether the task has converged enough to stop.

Record meaningful decisions and lessons in `workflow-ledger` when the work is medium or larger.

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

Distilled for Codex from the Ouroboros specification-first workflow:

- https://github.com/Q00/ouroboros
