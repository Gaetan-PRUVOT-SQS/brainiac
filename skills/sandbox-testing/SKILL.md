# sandbox-testing

Use this skill when tests could write files, touch state or scan broad paths.

## Procedure

1. Copy or prepare test input in a temporary directory.
2. Avoid running destructive checks in the real home.
3. Keep caches inside temporary locations when possible.
4. Clean up only files created by the test.
5. Report limits of isolation.

## Output

- Sandbox path
- Command run
- Cleanup status
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
