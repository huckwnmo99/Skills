# Skills

This repository publishes a small Codex skillbook assembled from the strongest parts of several agent-skill systems. It is not a raw mirror of the source repositories. The source projects are treated as ingredients; this repo keeps the parts that are useful for everyday Codex work.

- `karpathy-guidelines`
- `matt-engineering-workflows`
- `ouroboros-spec-loop`
- `codex-harness-adapter`
- `workflow-ledger`

## Operating Model

```text
Karpathy guidelines        -> baseline behavior
Ouroboros spec loop        -> clarify large or vague work before execution
Matt engineering workflows -> choose diagnosis, TDD, PRD, issue slicing, or architecture loops
Workflow ledger            -> preserve progress, decisions, completed work, and lessons
Codex harness adapter      -> route between skills and decide when harness-style structure is justified
```

Use the smallest layer that safely solves the request. Do not run the entire stack for every task.

## karpathy-guidelines

`karpathy-guidelines` is the default coding-agent discipline:

- think before coding,
- prefer simple direct code,
- make surgical changes,
- define verifiable success criteria.

The skill lives at:

```text
skills/karpathy-guidelines/
```

## ouroboros-spec-loop

`ouroboros-spec-loop` turns vague or strategic requests into execution-ready seeds before coding:

- interview,
- seed,
- execute,
- evaluate,
- evolve.

The skill lives at:

```text
skills/ouroboros-spec-loop/
```

## matt-engineering-workflows

`matt-engineering-workflows` routes day-to-day engineering work into focused loops:

- alignment,
- diagnosis,
- TDD,
- PRD synthesis,
- issue slicing,
- architecture review.

The skill lives at:

```text
skills/matt-engineering-workflows/
```

## codex-harness-adapter

`codex-harness-adapter` routes Codex work across existing skills, `workflow-ledger`, and optional harness-style agent roles without overbuilding a full harness.

Use it to decide:

- task size,
- primary workflow,
- skills to use or skip,
- whether `workflow-ledger` is needed,
- whether harness-style role design is justified,
- how repeated lessons should become guardrails or skill updates.

The skill lives at:

```text
skills/codex-harness-adapter/
```

## workflow-ledger

`workflow-ledger` maintains a progressive task ledger with:

- a small `README.md` router,
- `planned/`, `in-progress/`, and `completed/` status folders,
- categorized archives for plans, progress snapshots, completions, decisions, and lessons,
- a lessons loop that turns recurring mistakes into guardrail or skill-update candidates.

The skill lives at:

```text
skills/workflow-ledger/
```

## Sources

These skills are distilled from:

- Karpathy-inspired guidelines: https://github.com/forrestchang/andrej-karpathy-skills
- Matt Pocock skills: https://github.com/mattpocock/skills
- Ouroboros: https://github.com/Q00/ouroboros
