# secrets-management

Use this skill when tokens, credentials or private config may be involved.

## Procedure

1. Do not print secrets.
2. Do not commit secrets.
3. Use environment variables or secret managers.
4. Rotate exposed credentials.
5. Add ignore rules for secret files.

## Output

- Secret sources checked
- Risk found
- Mitigation
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
