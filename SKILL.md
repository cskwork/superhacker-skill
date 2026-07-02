---
name: superhacker
description: Authorized-security router for scoped security work. Use for /superhacker, pentest/security audit, vulnerability search or clue triage, red team, cloud/IAM hardening, detection/IR/forensics/threat intel, mobile/compliance, or CTF.
---

# /superhacker - authorized-security routing

One security objective -> route to the right reference -> least-impact execution -> evidence-backed report.

## Core principles

1. **Authorization-first (HARD STOP).** Confirm written scope / rules of engagement before any active or
   intrusive action. Default to passive / read-only. Owned systems, lab, and CTF are self-authorizing -
   state which applies in one line. Active scanning, exploitation, credential attacks, or persistence
   against a system you cannot prove is in-scope: refuse and ask.
2. **Least impact.** Order actions passive->active, non-destructive->destructive. Never DoS, never
   mass-target, never destroy data or establish persistence beyond the agreed scope.
3. **Evidence-based.** Every finding is backed by reproducible evidence (command + output, artifact hash,
   screenshot). A plausible-but-unverified finding is the failure mode - drop or downgrade it.
4. **Defensive purpose.** Offensive technique exists only to improve defense: always deliver detection +
   remediation guidance alongside any exploit finding. Refuse out-of-scope or malicious use (mass
   targeting, crimeware, real-world malware deployment).
5. **Faithful reporting.** Accurate severity (no inflation), clear repro, and an explicit "not tested"
   section so silence is not read as safe.
6. **Output language.** Write prose in the user's language; keep identifiers, commands, tool names, and
   framework IDs in English.

## Engagement loop

1. **Scope.** One line: objective + authorization status (RoE / in-scope targets / allowed actions /
   owned-lab-CTF-vs-client) + posture (offensive / defensive / IR / forensic). Hard stop if active work
   lacks authorization.
2. **Frame & route.** Gather context passively; classify the intent into a reference via the routing table;
   load ONLY that reference file.
3. **Execute (least-impact).** Run the routed workflow passive->active, in-scope only; capture evidence
   as you go.
4. **Verify.** Reproduce every finding (command+output / artifact); rate severity; drop false positives.
   No unverified claims.
5. **Report.** Deliverable = severity-ordered findings report with repro + remediation + detection
   guidance (`templates/report-template.md`).

## Routing table (classify the intent, state the route in one line)

| Signal in the objective | Selected route | Reference |
|---|---|---|
| scope/footprint a target, OSINT, port/service scan, enumerate attack surface, vuln scan + triage, asset discovery | recon (Reconnaissance & Vulnerability Discovery) | `reference/recon.md` |
| test a web app or API, OWASP Top 10, SQLi/XSS/SSRF/IDOR/auth-bypass, GraphQL/REST, WAF behavior | web-api (Web & API Exploitation) | `reference/web-api.md` |
| network pentest, segmentation/VLAN review, IDS/IPS, traffic analysis, OT/ICS protocols (Modbus/DNP3), SCADA | network (Network & OT/ICS Security) | `reference/network.md` |
| red team op, adversary emulation, Active Directory attack paths, privilege escalation, lateral movement, phishing simulation, C2 (authorized) | redteam (Red Team & Adversary Emulation) | `reference/redteam.md` |
| AWS/Azure/GCP hardening, cloud misconfig, Kubernetes/RBAC, image scanning, runtime threat detection, container forensics | cloud-container (Cloud & Container Security) | `reference/cloud-container.md` |
| IAM policy review, least-privilege, PAM, MFA/SSO, zero trust / microsegmentation / BeyondCorp | identity (Identity, Access & Zero Trust) | `reference/identity.md` |
| secure SDLC, CI/CD security, SAST/DAST/SCA, secret scanning, code signing, IaC audit, TLS/crypto/key management | appsec (AppSec, DevSecOps & Cryptography) | `reference/appsec.md` |
| SIEM, log analysis, alert triage, detection rules (Sigma/YARA), threat hunting, LOTL/behavioral analytics, SOC playbooks | soc-detect (SOC, Detection Engineering & Threat Hunting) | `reference/soc-detect.md` |
| CTI, IOC/IOA management, STIX/TAXII, MISP, feed profiling, actor/campaign attribution, intelligence requirements | threat-intel (Threat Intelligence) | `reference/threat-intel.md` |
| active incident, containment/eradication/recovery, ransomware, BEC/phishing response, IR playbooks | incident-response (Incident Response, Ransomware & Phishing) | `reference/incident-response.md` |
| disk/memory imaging, timeline reconstruction, artifact analysis, static/dynamic malware analysis, reverse engineering, sandboxing | forensics (Digital Forensics & Malware Analysis) | `reference/forensics.md` |
| Android/iOS app analysis, mobile pentest, MASVS controls, MDM forensics | mobile (Mobile Security) | `reference/mobile.md` |
| compliance mapping (CIS, SOC 2, ISO 27001, PCI), policy/governance, risk, audit evidence, deception (honeytokens/canaries) | govern (Compliance, Governance & Deception) | `reference/govern.md` |
| find vulnerability clues/hints, bug bounty leads, source-aware triage, attack path ideas, suspicious routes/sinks/configs before validation | clue-hunt (Vulnerability Clue Discovery) | `reference/clue-hunt.md` |

## Reference map (load only the routed reference)

| Read this | When |
|---|---|
| `reference/authorization.md` | Scope/RoE gate - read at Scope, ALWAYS |
| `reference/recon.md` | Footprinting, OSINT, vuln scanning |
| `reference/web-api.md` | Web/API testing, OWASP Top 10 |
| `reference/network.md` | Network pentest, OT/ICS protocols |
| `reference/redteam.md` | Adversary emulation, AD attack paths |
| `reference/cloud-container.md` | Cloud hardening, K8s/container security |
| `reference/identity.md` | IAM review, zero trust design |
| `reference/appsec.md` | Secure SDLC, CI/CD, crypto/TLS |
| `reference/soc-detect.md` | Detection rules, threat hunting, SOC |
| `reference/threat-intel.md` | CTI, IOC/IOA, actor attribution |
| `reference/incident-response.md` | Active incident, ransomware, BEC |
| `reference/forensics.md` | Disk/memory imaging, malware analysis |
| `reference/mobile.md` | Android/iOS pentest, MASVS |
| `reference/govern.md` | Compliance mapping, governance, deception |
| `reference/clue-hunt.md` | Vulnerability clues, hypothesis ranking, validation queue |

## Final checklist (before claiming done)

- [ ] Authorization confirmed/stated (RoE / owned-lab / CTF)
- [ ] Route selected and only that reference loaded
- [ ] Least-impact ordering held (passive before active, non-destructive before destructive)
- [ ] Every finding reproduced with evidence (command + output / artifact hash / screenshot)
- [ ] Clues, hypotheses, and findings are labeled separately; no unverified clue is reported as a vulnerability
- [ ] Severity not inflated; "not tested" section explicitly stated
- [ ] Offensive findings paired with detection + remediation guidance
- [ ] Report delivered via `templates/report-template.md`
