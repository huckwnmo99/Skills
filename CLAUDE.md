# Agent Instructions

## Workflow Ledger Policy

For any task classified as Medium or larger, always use `workflow-ledger`.

Do not wait for the user to ask. Apply this rule automatically based on task size:

- **Tiny / Small**: no ledger required.
- **Medium and above**: create or resume a ledger under `docs/tasks/{task-slug}/` before starting work.

When resuming a session, check for an existing ledger first. If one exists, read its README and resume from `Next Action` before doing anything else.

## Skill Routing Policy

Always route through `codex-harness-adapter` first to classify task size. Then delegate skill selection to `matt-engineering-workflows` for concrete engineering tasks, or to `ouroboros-spec-loop` for specification work.

Do not stack multiple discovery or clarification workflows on the same task. Pick one and finish it.

## Ouroboros Usage Boundary

Ouroboros skills are for planning only: Interview and Seed. Do not proceed to execution (`ouroboros-run`, `ouroboros-evaluate`, `ouroboros-evolve`) without explicit user confirmation.

When a Seed is complete, always stop and ask:

> 계획이 완성됐습니다. 스킬을 사용해서 계획을 더 구체화할까요?

If the user confirms, use `ouroboros-evolve` to refine further.
If the user declines, hand off to `matt-engineering-workflows` for execution.

## Ouroboros Policy

Ouroboros skills require the local MCP server. If MCP tools are not available, stop and direct the user to the installation instructions in README.md under **Installation → Install Ouroboros MCP** before proceeding.

Do not simulate the Ouroboros loop manually without MCP.
