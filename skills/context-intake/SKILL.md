# context-intake

Use this skill before editing an unfamiliar project.

## Procedure

1. List top-level files and important config files.
2. Identify framework, language, package manager and test commands.
3. Read nearby files before changing code.
4. Detect project-specific conventions.
5. Avoid old histories unless explicitly requested.

## Output

- Project map
- Detected stack
- Relevant files
- Likely verification command
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
