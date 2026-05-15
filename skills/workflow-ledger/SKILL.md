---
name: workflow-ledger
description: Maintains a progressive task ledger with a small README router, status folders, categorized archives, and lessons learned. Use when starting, resuming, planning, implementing, debugging, refactoring, or completing medium-or-larger work that needs persistent context, progress tracking, decisions, lessons, or handoff notes.
---

# Workflow Ledger

## Purpose

Use this skill as the task memory layer. It records what is planned, what is in progress, what is complete, why important decisions were made, and what should be learned from mistakes, without forcing the agent to read every document every time.

It is not a PRD, TDD, diagnosis, or specification skill. Other skills may create those artifacts; this skill stores their location, status, and history.

## Quick Start

1. Classify the task size before starting work.
2. Look for an existing project ledger before creating a new one.
3. Use the project's existing task-doc convention if present; otherwise default to `docs/tasks/{task-slug}/README.md`.
4. Read the README first, then only the detailed documents it routes to.
5. Keep active details in `planned/`, `in-progress/`, and `completed/`.
6. Preserve only important history in `archive/planned/`, `archive/in-progress/`, `archive/completed/`, `archive/decisions/`, and `archive/lessons/`.
7. Update the README when the current status, next action, or required reading changes.

## Size Gates

- `Tiny`: typo, wording, one-line config, or tiny style change. Do not create a new ledger unless the user explicitly asks; at most add one short log line to an existing ledger.
- `Small`: clear single-file or single-step work. Use an existing README plus one `in-progress` note only when handoff or later resume matters.
- `Medium`: multi-file feature, bug, or refactor that may continue across sessions, needs decisions, or needs handoff. Create the ledger structure when needed; the minimum is README plus one active detail doc.
- `Large`: product direction, domain change, architecture, or long-running work. Use the full ledger and record important decisions.
- `Strategic`: roadmap, operating policy, core product workflow, or multi-agent work. Use the full ledger, categorized archives, and archive index.

## Directory Contract

Prefer the project's existing task documentation location. If none exists, use:

```text
docs/tasks/{task-slug}/
+-- README.md
+-- planned/
+-- in-progress/
+-- completed/
+-- archive/
    +-- README.md
    +-- planned/
    +-- in-progress/
    +-- completed/
    +-- decisions/
    +-- lessons/
```

All generated detail files must use `NN_YYYY-MM-DD_short-kebab-name.md`: two-digit sequence numbers within each folder, the current local date, and concise English kebab-case filenames.

## README Contract

The task README is a router, not the full document. Keep it short and current. It should contain:

- Purpose
- Current Status
- Size
- Owner
- Stakeholders
- Source of Truth
- Next Action
- Success Criteria
- Documents To Read
- Planned
- In Progress
- Completed
- Recent Archive
- Last Updated

Each routing section should keep only the current or most important links: up to 3 links for planned, in-progress, and completed sections, and up to 5 recent archive links. If the README starts becoming a long narrative, move details into the appropriate folder and leave only a summary plus links.

## Archive Rules

Archive only meaningful history:

- superseded plans
- decisions that will need future explanation
- important milestone or release snapshots
- verification outcomes needed for recurrence prevention
- lessons from mistakes, failed attempts, or blockers likely to recur

Do not archive routine thoughts, repeated progress chatter, ordinary completion summaries, or duplicate summaries already present in the README. Default to writing normal completion state in `completed/`; use `archive/completed/` only when the completion has historical value.

## Guardrails

- Use the smallest sufficient ledger depth for the task.
- Do not let documentation become larger than the work it supports.
- Keep only one active `in-progress` note unless the user asks for parallel tracks.
- Before trusting an existing ledger, check `Last Updated`, `Current Status`, and `Next Action`; if they conflict with the folder contents, refresh the README first.
- When a task completes, write a short completed summary and archive only historically important decisions or snapshots.
- Record lessons only when they prevent future mistakes; one-off lessons stay archived, repeated lessons become guardrail or skill-update candidates.
- Put code boundary notes in the active detail doc, not the README; uncertain boundaries stay `Unknown`.
- If another skill creates a PRD, issue, diagnosis, or spec, link it from the ledger with a 1-3 line summary instead of copying it wholesale.

Open `REFERENCE.md` only when sizing, naming, state, or archive rules are unclear. Open only the specific template needed when creating a file.

## Hooks

Three hooks are available in `scripts/` to enforce ledger rules automatically. Install them by adding the following to your project's `.claude/settings.json`:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Write",
        "hooks": [
          {
            "type": "command",
            "command": "bash skills/workflow-ledger/scripts/enforce-ledger-naming.sh"
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Write",
        "hooks": [
          {
            "type": "command",
            "command": "bash skills/workflow-ledger/scripts/check-ledger-size.sh"
          }
        ]
      },
      {
        "matcher": ".*",
        "hooks": [
          {
            "type": "command",
            "command": "bash skills/workflow-ledger/scripts/find-active-ledger.sh"
          }
        ]
      }
    ]
  }
}
```

What each hook does:

- `enforce-ledger-naming.sh`: Blocks Write if the filename inside `planned/`, `in-progress/`, or `completed/` does not match `NN_YYYY-MM-DD_short-kebab-name.md`.
- `check-ledger-size.sh`: Warns after Write if a file in `docs/tasks/` exceeds 150 lines.
- `find-active-ledger.sh`: Surfaces existing ledger READMEs once per session so the agent resumes from the correct state without manual prompting.

All three scripts require `jq`. Run `jq --version` to verify it is installed.
