# container-workflow

Use this skill for Docker, Compose or containerized development.

## Procedure

1. Inspect Dockerfile and compose files.
2. Check build context and layers.
3. Verify env and volumes.
4. Run minimal build or service check.
5. Avoid leaking secrets into images.

## Output

- Container changes
- Build/run result
- Risks
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
