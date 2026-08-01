# Identity, Access & Zero Trust (identity)
Defensive domain: fires on IAM reviews, privilege reduction, MFA/SSO gaps, and Zero Trust architecture design.

## When to route here
- IAM policy review or entitlement sprawl
- Least-privilege enforcement or standing-privilege elimination
- PAM (Privileged Access Management) gaps
- MFA missing or SSO misconfiguration
- Zero Trust / microsegmentation / BeyondCorp design or assessment

Not for: credential-based attacks or AD exploitation -> route to `redteam` instead.

## Authorization
Read-only and owned-data assumption. All analysis targets identities and policies within systems you own or are explicitly authorized to review. No active credential abuse or lateral movement.

## Covers
- Identity & Access Management (IAM)
- Zero Trust Architecture (ZTA)

## Workflow
1. Inventory all identities (human, service, federated) and their entitlements
2. Find excess privilege: unused permissions, standing admin, orphaned accounts
3. Enforce least-privilege + MFA: remove excess, require phishing-resistant MFA, enforce SSO
4. Design Zero Trust segmentation: define trust boundaries, microsegment by workload/identity
5. Verify policy: re-scan, confirm enforcement, check policy drift

## Tools
| Tool | Purpose |
|------|---------|
| IAM Access Analyzer | Unused access, external-sharing findings (AWS) |
| Entra / Azure AD review | Privileged role audit, Conditional Access gaps |
| PingCastle | AD health and privilege risk scoring |
| CISA ZT Maturity Model | Self-assessment against ZT pillars |

## Verification
- Export IAM findings and reproduce each excess-privilege path before reporting
- Confirm MFA enforcement by attempting auth without second factor on a test account
- Validate segmentation rules by attempting cross-segment access and confirming denial
- Re-run Access Analyzer / PingCastle post-remediation to confirm delta

## Framework mappings
| Framework | Relevant IDs |
|-----------|-------------|
| NIST SP 800-207 | Zero Trust Architecture (full document) |
| CISA ZTMM | Identity pillar, Device pillar |
| NIST CSF | PR.AC (Protect: Identity Management & Access Control) |
| CIS Controls | CIS Control 5 (Account Management), Control 6 (Access Control) |

## Deliverable
- **Entitlement inventory**: all identities, roles, and permissions mapped
- **Excess privilege findings**: each over-privileged path with reproduction steps
- **Remediation guidance**: specific policy changes, role removals, MFA requirements
- **Zero Trust gap analysis**: current vs. target maturity per CISA ZTMM pillar
- **Verification evidence**: before/after scan output confirming each finding resolved
