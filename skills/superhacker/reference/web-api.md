# Web & API Exploitation (web-api)
Active offensive testing of web applications and APIs; requires authorization before any active action.

## When to route here
- Testing a web app or REST/GraphQL API for vulnerabilities
- OWASP Top 10 or OWASP API Security Top 10 coverage
- SQLi, XSS, SSRF, IDOR, auth-bypass, mass assignment, broken object-level authorization
- WAF behavior analysis, parameter fuzzing, endpoint enumeration
- JWT/OAuth/session token attacks

Not for: server/network-layer attacks -> route to `network` instead. For full-kill-chain simulation including lateral movement -> route to `redteam`.

## Authorization
Requires written, in-scope Rules of Engagement (RoE) before any active action. Confirm target scope, IP ranges, and excluded systems. Refuse all active testing without RoE. Passive observation (traffic review, public API docs) is pre-authorization safe.

## Covers
Web Application Security, API Security

## Workflow
1. Map endpoints, auth flows, and trust boundaries (passive; Burp proxy, API docs, JS analysis)
2. Enumerate hidden paths and parameters (ffuf, Burp Intruder; rate-limit-aware)
3. Fuzz inputs for injection, logic, and validation failures (sqlmap authorized, Burp scanner)
4. Confirm each candidate with a minimal, non-destructive PoC (read-only payloads; no data modification unless explicitly scoped)
5. Assess business impact (data exposure, privilege escalation, lateral movement potential)
6. Document reproduction steps and propose remediation

## Tools
| Tool | Use |
|------|-----|
| Burp Suite | Intercept, replay, scan, intruder fuzzing |
| OWASP ZAP | Automated scanning, HUD passive mode |
| ffuf | Directory/parameter/vhost fuzzing |
| sqlmap | Authorized SQL injection detection and exploitation |
| Postman | API workflow testing, auth header manipulation |
| GraphQL introspection | Schema discovery, field enumeration |

## Verification
- SQLi: retrieve a non-sensitive, predictable value (e.g., DB version string) via UNION or error
- XSS: reflected payload returns in response and executes in controlled browser session; confirm DOM vs. reflected vs. stored
- SSRF: callback to collaborator/out-of-band server (Burp Collaborator, interactsh)
- IDOR: access resource owned by account B while authenticated as account A; confirm distinct session cookies
- Auth bypass: reach protected endpoint without valid credentials; record HTTP 200 + response body diff

## Framework mappings
| ID | Reference |
|----|-----------|
| OWASP Top 10 2021 | A01–A10 |
| OWASP API Security Top 10 2023 | API1–API10 |
| ATT&CK TA0001 | Initial Access |
| ATT&CK T1190 | Exploit Public-Facing Application |
| ATT&CK T1078 | Valid Accounts (credential-based auth bypass) |

## Deliverable
- **Scope summary**: targets tested, exclusions, dates
- **Findings table**: ID, title, severity (CVSS), endpoint, parameter
- **Reproduction steps**: request/response pairs, PoC description (no live weaponized payloads)
- **Business impact**: data at risk, affected user population, exploit preconditions
- **Remediation**: per-finding fix guidance (parameterized queries, output encoding, authz checks, rate limiting)
- **Detection guidance**: log signatures, WAF rules, anomaly indicators for each finding class
