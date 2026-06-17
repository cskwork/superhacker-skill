# AppSec, DevSecOps & Cryptography (appsec)
Fires when the task involves securing the software pipeline, build artifacts, or cryptographic configuration; posture: defensive.

## When to route here
- Secure SDLC design, shift-left security gates
- SAST, DAST, SCA integration in CI/CD
- Secret scanning, credential leak prevention
- Code signing, supply-chain integrity (SLSA)
- IaC security audit (Terraform, CloudFormation, Helm)
- TLS configuration, key management, certificate lifecycle
- Crypto algorithm selection, PKI, signing key rotation

Not for: live vulnerability exploitation of web endpoints -> route to **web-api** instead.

## Authorization
Defensive posture. Assumes read-only access to owned source code, pipelines, and infrastructure configs. All scanning is passive against assets you own or are contracted to assess. No active exploitation.

## Covers
DevSecOps, Cryptography

## Workflow
1. Threat-model the pipeline (data flows, trust boundaries, third-party deps)
2. Add SAST gate (Semgrep rules matched to language/framework)
3. Add SCA + container image scan (Grype/Trivy) and block on CRITICAL/HIGH CVEs
4. Add secret scanning gate (gitleaks pre-commit + CI step)
5. Audit IaC for misconfigs (tfsec/Checkov)
6. Verify TLS/crypto config (testssl.sh against staging endpoint)
7. Enforce artifact signing and provenance (cosign/sigstore, SLSA build level)
8. Gate all checks in CI; block merge on failures

## Tools
| Tool | Purpose |
|---|---|
| Semgrep | SAST — pattern-based static analysis |
| Trivy / Grype | SCA + container image CVE scanning |
| gitleaks | Secret and credential scanning |
| cosign / sigstore | Container and artifact signing |
| tfsec / Checkov | IaC misconfiguration audit |
| testssl.sh | TLS/SSL configuration verification |

## Verification
- SAST: reproduce finding by running Semgrep rule in isolation on the flagged file; confirm line match
- SCA: cross-check CVE ID in NVD and vendor advisory; confirm affected version range includes current dep
- Secrets: confirm secret is live (attempt minimal auth call or check revocation status); do not log the value
- IaC: apply `--dry-run` or plan diff to confirm tfsec finding maps to a deployable misconfiguration
- TLS: capture testssl.sh JSON output; verify cipher/protocol in an independent client (`openssl s_client`)
- Signing: verify signature chain with `cosign verify` against the expected key/Rekor entry

## Framework mappings
| Framework | Relevant IDs |
|---|---|
| OWASP SAMM | Governance, Design, Implementation, Verification practice areas |
| SLSA | Build L1-L3 provenance, source integrity |
| NIST SSDF (800-218) | PO, PS, PW, RV task families |
| NIST SP 800-57 | Key management recommendations |
| CIS Benchmarks | Pipeline and registry hardening |

## Deliverable
- Finding list: tool, rule/CVE ID, file/line or resource, severity, evidence snippet
- Risk summary: exploitability + business impact per finding
- Remediation guidance: exact config change, dependency upgrade, or code fix
- CI gate recommendations: which checks to add, enforcement policy (warn vs block)
- Crypto config report: deprecated algorithms, weak key lengths, certificate expiry timeline
