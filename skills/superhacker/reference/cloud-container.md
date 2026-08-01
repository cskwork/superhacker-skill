# Cloud & Container Security (cloud-container)
Fires on cloud/cluster hardening, misconfig, and runtime threat detection; posture: both (passive-first, escalate only when in-scope).

## When to route here
- AWS/Azure/GCP hardening or misconfiguration review
- Kubernetes RBAC, pod security, or admission control gaps
- Container image scanning or runtime threat detection
- Cloud IAM over-permission or privilege escalation paths
- Container forensics or runtime anomaly investigation

Not for: broad identity/IAM architecture -> route to `identity` instead.

## Authorization
Passive-first. Read-only enumeration and benchmark checks require no additional gate. Active remediation or exploit-path validation requires written in-scope Rules of Engagement (RoE) before proceeding; refuse active actions otherwise.

## Covers
Cloud Security, Container Security

## Workflow
1. Enumerate cloud/cluster config (IAM policies, SGs, public buckets, node pools, RBAC bindings)
2. Check findings against CIS Benchmarks (CIS AWS/Azure/GCP Foundations, CIS Kubernetes)
3. Identify misconfigs and over-permissioned roles/service accounts
4. Scan container images for CVEs and secrets
5. Deploy/review runtime detection rules (Falco policies, GuardDuty findings)
6. Remediate via IaC (Terraform/Helm patches); validate controls re-run clean

## Tools
| Tool | Use |
|------|-----|
| ScoutSuite | Multi-cloud config audit |
| Prowler | AWS/Azure/GCP CIS checks |
| kube-bench | Kubernetes CIS benchmark |
| Trivy | Image + IaC + SBOM scanning |
| Falco | Kubernetes runtime threat detection |
| cloudsplaining | AWS IAM least-privilege analysis |

## Verification
- Re-run the same tool post-fix and confirm finding no longer appears
- Cross-check IAM policies with `cloudsplaining` before and after to confirm privilege reduction
- Validate Falco rule triggers in a controlled lab pod before production deployment
- Reproduce image CVE with Trivy on the exact digest; confirm clean on patched image

## Framework mappings
| Framework | Relevant IDs |
|-----------|-------------|
| ATT&CK Cloud Matrix | T1078.004, T1530, T1537, T1610, T1611 |
| CIS Benchmarks | CIS AWS Foundations v2, CIS Kubernetes v1.8 |
| NIST CSF | ID.AM, PR.AC, DE.CM, RS.AN |

## Deliverable
Report sections:
1. Scope and authorization statement
2. Config enumeration summary (assets, services, cluster version)
3. CIS benchmark gap table (control ID, current state, expected state, severity)
4. Misconfig and over-permission findings (resource ARN/path, impact, evidence)
5. Image scan results (CVE ID, CVSS, affected layer, fix version)
6. Runtime detection coverage (rules deployed, gaps, sample alert)
7. Remediation guidance — IaC snippets, policy diffs, patched image tags
8. Re-validation evidence (tool output before/after)
