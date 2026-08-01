# Compliance, Governance & Deception (govern)

Fires when the task involves framework mapping, audit evidence, risk/policy work, or deception layer deployment. Posture: defensive.

## When to route here

- Compliance mapping request: CIS Controls, SOC 2, ISO 27001, PCI DSS, NIST CSF
- Gap assessment, audit evidence collection, control inventory
- Policy authoring, risk register, GRC tracker work
- Honeytoken/canary deployment, deception layer design

Not for: active vulnerability scanning or exploit testing -> route to `recon` instead. Detection rule authoring and alert triage -> route to `soc-detect` instead.

## Authorization

Defensive posture. Assumes owned or authorized environment. All assessments read-only against systems you own or have written authorization to audit. No active exploitation.

## Covers

- Compliance & Governance
- Deception Technology

## Workflow

1. Pick framework(s) matching the regulatory or business driver (SOC 2, ISO 27001, PCI, CIS).
2. Map existing controls to framework requirements; inventory evidence artifacts.
3. Run gap assessment: identify missing controls, evidence gaps, policy voids.
4. Produce prioritized remediation plan (risk-ranked, owner-assigned).
5. Deploy deception layer (honeytokens, canary tokens, decoy credentials) at high-value paths.
6. Wire deception alerts into monitoring; validate alert fires on synthetic access.

## Tools

| Tool | Purpose |
|---|---|
| CIS-CAT Pro | Automated CIS benchmark scoring |
| OpenSCAP | SCAP-based configuration compliance scanning |
| GRC trackers (e.g., Tugboat Logic, Drata, Vanta) | Control evidence collection and audit workflow |
| Canarytokens (canarytokens.org) | Honeytoken generation and alerting |

## Verification

- Re-run CIS-CAT/OpenSCAP after remediation; compare scored reports before/after.
- For each gap finding, link to a specific control ID and the missing evidence artifact.
- Canary: trigger the token deliberately; confirm alert fires with expected metadata (IP, timestamp, token ID) before declaring deployed.
- Remediation plan items: mark closed only when evidence artifact is present in the GRC tracker and control re-test passes.

## Framework mappings

| Framework | Key IDs relevant to this domain |
|---|---|
| NIST CSF 2.0 | GV (Govern), ID.GV, PR.IP, DE.CM |
| CIS Controls v8 | IG1-IG3 basics; CIS Control 3 (Data Protection), 4 (Secure Config), 16 (Application Security) |
| ISO 27001:2022 | Annex A 5 (Organizational), 8 (Technological controls) |
| SOC 2 | CC1-CC9 (Common Criteria); availability, confidentiality, PI trust service criteria |
| PCI DSS v4 | Req 1-2 (network config), 6 (secure systems), 12 (policy) |
| MITRE ATT&CK | T1078 (Valid Accounts) — canary detects credential abuse; T1557 (Adversary-in-the-Middle) — policy/network scope |

## Deliverable

- **Control inventory**: framework requirement -> current control mapping -> evidence artifact path
- **Gap register**: control ID, description, risk rating, remediation owner, target date
- **Remediation plan**: prioritized action list with acceptance criteria
- **Deception coverage map**: token locations, alert routing, test-fire confirmation
- **Audit evidence package**: screenshots, config exports, scan reports, policy docs ready for auditor review
