# memory-hygiene

Use this skill when preferences, history, secrets or persistent context are involved.

## Procedure

1. Do not load old projects unless explicitly requested.
2. Do not store tokens or secrets.
3. Keep global preferences separate from project state.
4. Record durable rules only when the user asks.
5. Prefer pointers over duplicating private content.

## Output

- What was read
- What was intentionally not read
- What was persisted, if anything
## Evidence

A good use of this skill should leave at least one concrete artifact:

- a decision, checklist, command, test result, design note, finding or patch;
- the assumptions that mattered;
- the remaining risk or verification gap.

## Failure Modes

Avoid these common failures:

- giving generic advice without applying it to the task;
- skipping verification when a check is available;
- hiding uncertainty or inventing evidence;
- expanding scope beyond the user request.
