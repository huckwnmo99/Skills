# Codex Harness Adapter Reference

## Intent

This skill prevents process sprawl. It turns a large set of available skills into a small decision tree for Codex work.

It should answer:

- What is the smallest safe workflow?
- Which one skill family should lead?
- Is persistent task memory needed?
- Is harness-style role design justified?
- How do lessons become guardrails or skill changes?

## Size Model

### Tiny

Examples: typo, wording, one-line config, small style tweak.

Use:

- `karpathy-guidelines`

Avoid:

- `workflow-ledger`
- `harness`
- PRD/spec/ADR work

### Small

Examples: narrow single-file bug, simple UI copy change, small config update.

Use:

- `karpathy-guidelines`
- one relevant Matt-derived original skill, usually `diagnose`, `tdd`, `grill-with-docs`, or `zoom-out`
- existing ledger log only if it helps future resume

Avoid:

- new ledger
- harness
- multi-step planning docs

### Medium

Examples: multi-file bug, feature slice, refactor, work that may resume later.

Use:

- `workflow-ledger` lightly when context matters
- one primary original skill, usually `diagnose`, `tdd`, `to-prd`, `to-issues`, `triage`, or `improve-codebase-architecture`
- focused verification

Avoid:

- harness
- multiple discovery workflows
- new skill creation

### Large

Examples: product workflow, domain model, architecture change, multi-day feature.

Use:

- `workflow-ledger`
- `ouroboros-spec-loop` or a concrete `ouroboros-*` skill when the task is conceptually unclear
- one Matt-derived execution skill when implementation starts
- role-based review if needed
- lessons for recurring or high-risk mistakes

Avoid:

- duplicate PRD/spec/ADR content
- full harness unless roles or handoff justify it

### Strategic

Examples: agent operating model, repeated project workflow, multi-role automation, skillbook evolution.

Use:

- `harness`
- `workflow-ledger`
- role/skill map
- validation plan
- lesson-to-skill evolution policy

## Skill Routing

Use this table as the default route:

| Need | Primary skill |
| --- | --- |
| prevent overbuild | `karpathy-guidelines` |
| choose among Matt skills | `matt-engineering-workflows` |
| unclear large request | `ouroboros-spec-loop` or `ouroboros-interview` |
| Seed from clarified requirements | `ouroboros-seed` |
| Execute Seed | `ouroboros-run` |
| Evaluate execution | `ouroboros-evaluate` |
| hard bug or regression | `diagnose` |
| behavior-first implementation | `tdd` |
| PRD | `to-prd` |
| issue breakdown | `to-issues` |
| architecture improvement | `improve-codebase-architecture` |
| persistent task memory | `workflow-ledger` |
| agent/team operating model | `harness` |
| new reusable procedure | `write-a-skill` |

## Codex Role Map

When harness-style work is justified, map roles to Codex-friendly artifacts:

| Role | Responsibility | Likely skills |
| --- | --- | --- |
| Product/Ops Analyst | user workflow, policy, non-technical context | `ouroboros-interview`, `to-prd`, `grill-with-docs` |
| Spec Architect | ambiguity reduction, acceptance criteria | `ouroboros-seed`, `ouroboros-spec-loop`, `workflow-ledger` |
| Implementation Engineer | small code changes, tests, integration | `karpathy-guidelines`, `tdd` |
| Debugger | reproduce and fix failures | `diagnose` |
| QA/Reviewer | verification, regressions, cross-boundary checks | `ouroboros-evaluate`, `diagnose` |
| Ledger Keeper | current state, decisions, lessons | `workflow-ledger` |
| Harness Maintainer | role/skill map updates | `harness`, `write-a-skill` |

Use role briefs or task docs unless the project specifically supports persistent agent files.

## Anti-Overbuild Rules

- Never create a harness for a one-off implementation task.
- Never use two discovery workflows for the same task.
- Never create a new skill before checking whether an existing skill can be updated.
- Never let documentation exceed the value of the work it supports.
- Never copy long PRD/spec/diagnosis content into `workflow-ledger`; link and summarize.
- If the user asks for implementation, implementation remains the default.

## Lesson Escalation

Use `workflow-ledger archive/lessons` for preventable mistakes:

1. Write a lesson for recurring or high-risk preventable mistakes.
2. If a similar lesson appears again, propose a guardrail.
3. If it appears a third time, update an existing skill or create a focused new skill.
4. If the mistake is high-risk, recommend a guardrail immediately.

Do not record lessons for every minor inconvenience.

## Harness Decision Template

Use `templates/orchestration-decision.md` when a routing decision should be saved.
