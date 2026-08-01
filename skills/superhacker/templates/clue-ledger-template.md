# Vulnerability Clue Ledger

| ID | Signal | Evidence | Hypothesis | Class | Confidence | Validation status | Least-impact next check | Route |
|---|---|---|---|---|---|---|---|---|
| CLUE-001 |  | file/line, request ID, log, config key |  |  | low / medium / high | needs-info / passive-only / ready-for-authorized-validation / rejected / confirmed-finding |  | reference/*.md |

## Field rules

- `Signal`: observable fact, not interpretation.
- `Evidence`: pointer to file/line, request ID, log entry, config key, screenshot, or artifact hash.
- `Hypothesis`: possible weakness and why the signal suggests it.
- `Class`: vulnerability family such as IDOR, SSRF, injection, auth/session, file/path, business logic, secret/config, supply chain, cloud/container, client-side, race/state.
- `Confidence`: confidence in the hypothesis before validation, not severity.
- `Validation status`: block finding language until reproduced.
- `Least-impact next check`: passive or minimally invasive validation step; active checks require scope.
- `Route`: existing domain reference to use for validation or remediation.

## Status definitions

| Status | Meaning |
|---|---|
| needs-info | More context is required before validation can be planned |
| passive-only | Active validation is not authorized; keep as a clue |
| ready-for-authorized-validation | Scope permits the next validation step |
| rejected | Evidence or reasoning disproved the hypothesis |
| confirmed-finding | Reproduced with evidence and ready for `templates/finding-template.md` |
