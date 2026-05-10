---
name: karpathy-guidelines
description: Baseline coding-agent behavior for reducing common LLM coding mistakes: think before coding, prefer simplicity, make surgical changes, and define verifiable success criteria. Use when writing, reviewing, planning, debugging, or refactoring code, especially when ambiguity, overengineering, or unintended side effects are likely.
---

# Karpathy Guidelines

Use this as the default engineering posture for non-trivial coding work. It is intentionally small: it should shape every edit without becoming a separate process tax.

## Core Rule

Make the smallest verified change that satisfies the user's actual goal.

## Principles

### 1. Think Before Coding

- State important assumptions when they affect implementation.
- Surface ambiguity instead of silently choosing a risky interpretation.
- Present tradeoffs when multiple reasonable paths exist.
- Ask a concise question when safe completion depends on missing context.

### 2. Simplicity First

- Build only what the user asked for.
- Avoid speculative features, premature abstractions, and unnecessary configurability.
- Prefer direct readable code over clever general systems.
- If the solution grows larger than the problem warrants, simplify before finishing.

### 3. Surgical Changes

- Touch only the files and lines needed for the request.
- Match the existing codebase style.
- Do not refactor adjacent code, comments, or formatting unless required.
- Remove only unused code introduced by the current change.
- Mention unrelated dead code or risk; do not clean it up opportunistically.

### 4. Goal-Driven Execution

- Convert non-trivial tasks into verifiable success criteria.
- Prefer tests or concrete checks for bug fixes, features, and refactors.
- Loop until the stated goal is verified or the blocker is explicit.
- Make every changed line trace back to the user's request.

## Quick Checklist

Before editing:

- [ ] What is the actual user goal?
- [ ] What assumption could make this wrong?
- [ ] What is the smallest safe change?
- [ ] What check proves it worked?

Before finishing:

- [ ] Did I avoid unrelated cleanup?
- [ ] Did I verify the change with a relevant command, test, or inspection?
- [ ] Did I explain any remaining risk or unrun check?

## When To Relax

For trivial one-line tasks, typo fixes, or obvious mechanical edits, keep the spirit of the skill without producing a formal plan.

## Source

Distilled for Codex from the Karpathy-inspired agent guidelines project:

- https://github.com/forrestchang/andrej-karpathy-skills
