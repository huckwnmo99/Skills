# Skills

This repository publishes a Codex skillbook assembled from original upstream skills plus a small amount of Codex-specific routing.

The intent is:

- preserve useful original skills as real `SKILL.md` folders,
- adjust names only where needed to avoid collisions or Claude-specific assumptions,
- add thin coordination skills so Codex knows which original skill to use when,
- keep task memory and lesson promotion in `workflow-ledger`.

- `karpathy-guidelines`
- `matt-engineering-workflows`
- `ouroboros-spec-loop`
- `codex-harness-adapter`
- `workflow-ledger`

## Skill Groups

### Base discipline

- `karpathy-guidelines`

### Matt Pocock engineering skills

- `diagnose`
- `grill-with-docs`
- `improve-codebase-architecture`
- `prototype`
- `setup-matt-pocock-skills`
- `tdd`
- `to-issues`
- `to-prd`
- `triage`
- `zoom-out`
- `caveman`
- `grill-me`
- `write-a-skill`
- `git-guardrails-claude-code`
- `migrate-to-shoehorn`
- `scaffold-exercises`
- `setup-pre-commit`
- `edit-article`
- `obsidian-vault`

### Ouroboros core skills

These are prefixed with `ouroboros-` so generic names like `run`, `seed`, and `status` do not collide with other skillbooks.

- `ouroboros-auto`
- `ouroboros-brownfield`
- `ouroboros-evaluate`
- `ouroboros-evolve`
- `ouroboros-interview`
- `ouroboros-pm`
- `ouroboros-ralph`
- `ouroboros-run`
- `ouroboros-seed`
- `ouroboros-status`
- `ouroboros-unstuck`

### Local coordination skills

- `matt-engineering-workflows`
- `ouroboros-spec-loop`
- `codex-harness-adapter`
- `workflow-ledger`

## Operating Model

```text
Karpathy guidelines          -> baseline behavior
Ouroboros original skills    -> interview, seed, run, evaluate, evolve
Matt original skills         -> diagnose, TDD, PRD, issues, triage, architecture, etc.
Workflow ledger              -> preserve progress, decisions, completed work, and lessons
Codex coordination skills    -> route between originals and avoid overbuilding
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

## matt-engineering-workflows

`matt-engineering-workflows` is a router over the Matt-derived original skills. It should choose one primary skill, such as `diagnose`, `tdd`, `to-prd`, `to-issues`, `triage`, `grill-with-docs`, or `improve-codebase-architecture`.

The skill lives at:

```text
skills/matt-engineering-workflows/
```

## ouroboros-spec-loop

`ouroboros-spec-loop` is a router over the prefixed Ouroboros original skills. It turns vague or strategic requests into execution-ready seeds before coding:

- interview,
- seed,
- execute,
- evaluate,
- evolve.

The skill lives at:

```text
skills/ouroboros-spec-loop/
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

Original or adapted skills come from:

- Karpathy-inspired guidelines: https://github.com/forrestchang/andrej-karpathy-skills
- Matt Pocock skills: https://github.com/mattpocock/skills
- Ouroboros: https://github.com/Q00/ouroboros

See `licenses/` for upstream MIT license notices where available.
