# refactoring

Use this skill when improving structure without changing behavior.

## Procedure

1. Identify duplicated or confusing code.
2. Preserve public behavior.
3. Refactor in small steps.
4. Run regression checks.
5. Avoid cosmetic churn.

## Output

- Refactor target
- Behavior preserved
- Tests run
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
