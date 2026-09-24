# dependency-security

Use this skill for dependency risk and updates.

## Procedure

1. Identify package manager and lockfile.
2. Check known vulnerabilities when tooling exists.
3. Prefer minimal updates.
4. Watch for breaking changes.
5. Run tests after changes.

## Output

- Packages reviewed
- Updates applied
- Risk notes
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
