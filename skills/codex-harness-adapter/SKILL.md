---
name: codex-harness-adapter
description: Routes Codex work across existing skills, workflow-ledger, and optional harness-style agent roles without overbuilding a full harness. Use when designing, adapting, auditing, or operating a project-level agent workflow, when multiple skills or agent roles may overlap, or when repeated workflow-ledger lessons suggest guardrail, skill, or harness changes.
---

# Codex Harness Adapter

## Purpose

Use this as a thin orchestration layer. It decides when to use existing skills, when to create a workflow ledger, and when a harness-style agent team is justified.

It does not replace `harness`, `workflow-ledger`, `write-a-skill`, TDD, diagnosis, PRD, or architecture skills. It routes between them and prevents duplicate process.

## Core Rule

Do the smallest workflow that can safely complete the user's request.

Harness work is an exception, not the default. Use it only when role separation, handoff, repeated work, or repeated failure makes the extra structure pay for itself.

## Quick Start

1. Classify task size: `Tiny`, `Small`, `Medium`, `Large`, or `Strategic`.
2. Pick one primary workflow family.
3. Use `workflow-ledger` only when persistent context, handoff, decisions, or lessons matter.
4. Use `harness` only for project-level agent/team design, repeated workflows, or explicit harness requests.
5. After work completes, route repeated mistakes through `workflow-ledger archive/lessons`.
6. Promote lessons only when recurrence justifies it: guardrail first, existing skill update second, new skill last.

## Routing Table

- `Tiny`: use base coding discipline only. Do not create ledger or harness.
- `Small`: use the relevant implementation or diagnosis skill. Existing ledger log only if useful.
- `Medium`: use `workflow-ledger` lightly plus one execution skill such as `diagnose`, `tdd`, `to-prd`, or `to-issues`.
- `Large`: use `workflow-ledger`, one discovery/spec workflow, and role-based review if needed.
- `Strategic`: use `harness` plus `workflow-ledger` to design roles, skill mapping, validation, and evolution.

## One Discovery Workflow

For any one task, use at most one discovery or clarification workflow:

- unclear product/domain problem: use Ouroboros-style specification or `grill-with-docs`
- PRD needed: use `to-prd`
- issue breakdown needed: use `to-issues`
- bug or regression: use `diagnose`
- architecture improvement: use `improve-codebase-architecture`
- harness/team design: use `harness`

## Codex Adaptation

The existing `harness` skill is Claude-oriented. In Codex, do not assume `.claude/agents`, `.claude/skills`, `TeamCreate`, or `SendMessage` are available.

Prefer this mapping:

- Claude agent files -> explicit role briefs or reusable local docs
- Claude skills -> installed Codex skills or local `SKILL.md` files
- Team communication -> parent agent coordination, subagents when explicitly requested, or written handoff notes
- CLAUDE.md history -> `workflow-ledger` decisions and lessons

Create Claude-specific files only when the project actually uses Claude Code or the user asks for them.

## Harness Activation Gates

Use harness-style design only when at least one is true:

- the user explicitly asks for a harness, agent team, or orchestration design
- the workflow needs two or more distinct roles with different responsibilities
- repeated work has occurred three or more times
- repeated lessons show the current process is failing
- handoff between agents or sessions is important
- a project-level operating model is being created or audited

Otherwise, stay with the smallest direct workflow.

## Skill Evolution

Use this escalation path:

```text
first occurrence -> workflow-ledger lesson
second similar occurrence -> guardrail candidate
third similar occurrence -> update existing skill or create a new focused skill
high-risk mistake -> immediate guardrail or skill-update recommendation
```

Prefer updating an existing skill over creating a new one. Use `write-a-skill` only when a repeated pattern is specific, teachable, and reusable.

## Output

When this skill is used, produce only the useful orchestration decision:

- task size
- primary workflow
- skills to use
- skills intentionally not used
- whether `workflow-ledger` is needed
- whether harness is justified
- handoff or lesson policy

Open `REFERENCE.md` only when the routing decision is not obvious.
