# Finding Record

## Identity

| Field | Value |
|-------|-------|
| Finding ID | FIND-__________________ |
| Title | __________________ |
| Date discovered | __________________ |
| Tester | __________________ |
| Status | open / remediated / accepted-risk / false-positive |

## Severity

CVSS v3.1 base score: __________________  (vector: __________________)

Qualitative (if no CVSS): Critical / High / Medium / Low / Informational

Rationale: __________________

## Affected Asset

| Field | Value |
|-------|-------|
| Host / URL / component | __________________ |
| Service / port | __________________ |
| Version | __________________ |
| Environment | prod / staging / lab |

## Classification

ATT&CK technique(s): __________________ (e.g., T1190, T1059.001)
ATT&CK tactic(s): __________________ (e.g., Initial Access, Execution)
OWASP category (if web): __________________ (e.g., A03:2021 Injection)
CWE: __________________ (e.g., CWE-89)
CVE (if applicable): __________________

## Reproduction Steps

Prerequisite state: __________________

```
Step 1: <command or action>
Observed: <output or behavior>

Step 2: <command or action>
Observed: <output or behavior>
```

Tested from: IP __________________ / tool __________________

## Evidence

| Artifact | Description | SHA-256 | Location |
|----------|-------------|---------|----------|
| screenshot-001.png | __________________ | __________________ | __________________ |
| payload-001.txt | __________________ | __________________ | __________________ |

## Impact

Confidentiality: None / Low / Medium / High
Integrity: None / Low / Medium / High
Availability: None / Low / Medium / High

Business impact: __________________

Exploitability (unauthenticated / post-auth / requires physical / requires social): __________________

## Remediation

Short-term (patch / config fix): __________________

Long-term (design fix / control): __________________

References:
- __________________
- __________________

Effort estimate: hours / days / weeks

## Detection Guidance

Log source(s) to monitor: __________________
Indicator(s) of exploitation:
- __________________
- __________________
SIEM rule or query sketch: __________________
