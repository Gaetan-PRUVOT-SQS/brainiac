# verification-loop

Use this skill after implementing or diagnosing changes.

## Procedure

1. Run the smallest meaningful check first.
2. If it fails, read the failure and fix the cause.
3. Re-run the relevant check.
4. Broaden tests when shared behavior changed.
5. Report failures honestly.

## Output

- Commands run
- Pass/fail result
- Remaining risk
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
