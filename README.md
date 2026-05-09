# Skills

This repository currently publishes these Codex skills:

- `codex-harness-adapter`
- `workflow-ledger`

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
