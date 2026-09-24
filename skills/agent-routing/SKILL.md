# agent-routing

Use this skill when a task may require choosing between preferences, skills,
tools, project context or safety constraints.

## Procedure

1. Read the current user request and identify the concrete objective.
2. Check active project instructions before global preferences.
3. Select only the skills needed for the task.
4. Identify required tools and permissions.
5. State assumptions only when they affect execution.
6. Continue with implementation when enough context exists.

## Output

- Selected context
- Selected skills
- Next action
- Any blocker or required permission
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
