---
name: matt-engineering-workflows
description: Routes practical engineering work through small composable loops: alignment, diagnosis, TDD, PRD, issue slicing, architecture review, and concise communication. Use when building or fixing software, converting ideas into implementation work, debugging failures, planning issues, or choosing which engineering workflow to run.
---

# Matt Engineering Workflows

Use this skill as a practical engineering workflow router. It distills the useful parts of the Matt Pocock skills approach into Codex-friendly behavior: small workflows, strong feedback loops, shared language, and vertical slices.

## Core Rule

Choose one primary engineering loop for the current job. Do not stack every workflow just because it exists.

## Workflow Router

- Ambiguous request or unclear domain language: align first with questions or a short domain note.
- Bug, regression, broken behavior, or performance issue: run the diagnosis loop.
- New feature with meaningful behavior risk: use test-driven vertical slices.
- Existing conversation needs product shape: synthesize a PRD.
- Plan needs execution tickets: split into independently verifiable vertical slices.
- Codebase feels tangled or hard to test: review architecture for deeper modules.
- User asks for brevity or token savings: compress communication while preserving accuracy.

## Diagnosis Loop

1. Build a fast feedback loop that reproduces the symptom.
2. Minimize the failing case.
3. Write 3 to 5 falsifiable hypotheses.
4. Instrument only the boundaries that distinguish those hypotheses.
5. Fix the cause, not the nearest symptom.
6. Add or document a regression check.
7. Ask what would have prevented the bug.

## TDD Loop

Use vertical slices:

```text
one behavior -> one failing test -> minimal implementation -> passing test -> repeat
```

Rules:

- Test observable behavior through public interfaces.
- Avoid bulk-writing imagined tests before learning from implementation.
- Do not refactor while red.
- Keep each slice demoable or independently verifiable.

## PRD Loop

Use when the conversation has enough context to describe a feature or product change.

Include:

- problem statement,
- user-facing solution,
- user stories,
- implementation decisions,
- testing decisions,
- out of scope,
- open questions.

Do not over-specify file paths or code snippets that will age quickly.

## Issue Slicing Loop

Break work into tracer-bullet issues:

- Each issue should deliver a narrow complete path through the system.
- Prefer several thin slices over one thick slice.
- Mark each slice as human-in-the-loop or agent-runnable.
- Make acceptance criteria concrete enough to verify.
- Publish or record blockers in dependency order.

## Architecture Loop

When implementation reveals mud:

- Identify modules whose interfaces are too wide or whose behavior is scattered.
- Look for "deep module" opportunities: simple interface, meaningful internal depth.
- Prefer incremental refactors protected by tests.
- Record architecture decisions where future agents will find them.

## Integration With Other Skills

- Use `karpathy-guidelines` as the baseline behavior for all loops.
- Use `workflow-ledger` when the task needs persistent state, decisions, lessons, or handoff.
- Use `ouroboros-spec-loop` before this skill when the task itself is still conceptually unstable.
- Use `codex-harness-adapter` when multiple skills or agent roles overlap.

## Source

Distilled for Codex from the Matt Pocock skills project:

- https://github.com/mattpocock/skills
