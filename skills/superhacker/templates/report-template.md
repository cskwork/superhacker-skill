# Security Assessment Report

## Scope & Authorization

| Field | Value |
|-------|-------|
| Engagement name | __________________ |
| Authorization type | RoE ref / owned-asset / lab / CTF |
| Authorization reference | __________________ |
| In-scope targets | __________________ |
| Tester(s) | __________________ |
| Assessment period | __________________ |

## Executive Summary

Assessment objective: __________________

Overall risk posture: Critical / High / Medium / Low

Key findings (count by severity):

| Severity | Count |
|----------|-------|
| Critical | __ |
| High | __ |
| Medium | __ |
| Low | __ |
| Informational | __ |

Narrative (2-4 sentences on what was found and the primary risk theme):

__________________

## Findings

Findings are ordered by severity (Critical first). Each finding follows the structure in `templates/finding-template.md`.

---

### [CRIT-001] [Finding title]

(Use finding-template.md fields: severity, CVSS, affected asset, ATT&CK / CWE / OWASP, reproduction steps, impact, remediation, detection guidance.)

---

### [HIGH-001] [Finding title]

---

### [MED-001] [Finding title]

---

*(Add blocks as needed; remove empty placeholder blocks before delivery.)*

## Not Tested

The following areas were explicitly excluded or not reached during this assessment. Absence from the findings list does not imply these areas are safe.

- __________________
- __________________

## Remediation Guidance

Priority order for remediation:

1. **Immediate (Critical/High)** -- patch or mitigate before next business day:
   - Finding CRIT-001: __________________
2. **Short-term (Medium)** -- address within 30 days:
   - __________________
3. **Long-term (Low/Informational)** -- track in risk register:
   - __________________

## Detection Guidance

For each exploitable finding, the following detection signals were identified (see individual finding records for SIEM query sketches and log sources):

| Finding | Log source | Key indicator |
|---------|------------|---------------|
| __________________ | __________________ | __________________ |

## Evidence & Reproduction Appendix

Raw evidence (screenshots, command output, artifact hashes) is referenced inline in each finding record. Retained copies are stored at:

- Location: __________________
- Encryption: yes / no -- method: __________________
- Retention: __ days after delivery
- Destruction method: __________________
