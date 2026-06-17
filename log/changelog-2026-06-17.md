# Changelog — 2026-06-17

## superhacker-skill: initial design rationale

### Goal

A single intent-routing security skill that mirrors the supergoal-skill pattern: one SKILL.md entry point, one authorization gate, one domain-reference loaded per invocation. The skill must cover the full professional security curriculum without becoming a monolith that loads 754 documents on every call.

### Source library

The upstream reference is mukul975/Anthropic-Cybersecurity-Skills, a 26-domain / 754-skill library organized by security discipline. It is comprehensive but not directly portable: loading all 754 skills on every invocation defeats the purpose of a routing skill and would exceed practical context budgets.

### Key decision: 26 domains -> 13 routing buckets

Rather than porting 754 individual skills (rejected, see below), the 26 source domains are collapsed into 13 named buckets. The bucket is the unit of lazy-loading: when the user's intent is classified, exactly one bucket's reference document is loaded. This keeps the routing layer thin and the per-invocation context cost bounded.

Mapping:

| Bucket | Label | Posture | Source domains covered |
|---|---|---|---|
| recon | Reconnaissance & Vulnerability Discovery | offensive | Reconnaissance, Vulnerability Management, Attack Surface Management |
| web-api | Web & API Exploitation | offensive | Web Application Security, API Security |
| network | Network & OT/ICS Security | both | Network Security, OT/ICS Security |
| redteam | Red Team & Adversary Emulation | offensive | Red Teaming, Penetration Testing, Active Directory attack, Phishing simulation |
| cloud-container | Cloud & Container Security | both | Cloud Security, Container Security |
| identity | Identity, Access & Zero Trust | defensive | Identity & Access Management, Zero Trust Architecture |
| appsec | AppSec, DevSecOps & Cryptography | defensive | DevSecOps, Cryptography |
| soc-detect | SOC, Detection Engineering & Threat Hunting | defensive | SOC Operations, Security Operations, Threat Hunting |
| threat-intel | Threat Intelligence | defensive | Threat Intelligence |
| incident-response | Incident Response, Ransomware & Phishing | defensive | Incident Response, Ransomware Defense, Phishing Defense (response) |
| forensics | Digital Forensics & Malware Analysis | defensive | Digital Forensics, Malware Analysis |
| mobile | Mobile Security | both | Mobile Security |
| govern | Compliance, Governance & Deception | defensive | Compliance & Governance, Deception Technology |

Grouping rationale: domains sharing threat model, toolchain, and practitioner persona were merged (e.g., Red Teaming + Penetration Testing + Active Directory attack share the same engagement workflow; Incident Response + Ransomware + Phishing response all operate under an active-incident frame). Domains with distinct tool stacks and audiences were kept separate (e.g., forensics and soc-detect overlap conceptually but differ in artifact handling and timing).

### Rejected alternative: port 754 individual skills

Porting all 754 upstream skills as discrete SKILL.md files would replicate the full library locally but break the single-skill routing model. Every invocation would either load everything (too heavy) or require the caller to pre-classify before invoking (pushes the routing burden upstream, negating the skill's value). The 13-bucket model keeps routing inside the skill and loading minimal.

### Safety choices

**Authorization gate (mandatory, first step):** Every invocation — offensive or defensive — begins with an explicit authorization check. The user must confirm written authorization, scope, and rules of engagement before any offensive technique is produced. This is a hard gate, not advisory. Rationale: the same techniques that enable authorized penetration testing enable unauthorized intrusion; the gate is the only signal distinguishing the two.

**Least-impact ordering:** Within offensive buckets, techniques are sequenced from least-invasive to most-invasive. Passive recon before active scanning, read-only enumeration before exploitation, non-destructive PoC before weaponized payload. This mirrors responsible disclosure practice and reduces accidental harm in legitimate engagements.

**Offense always paired with detection and remediation:** No offensive output is produced without a corresponding defensive pairing — the detection signature and the remediation step. Rationale: a practitioner who can exploit but cannot explain how to detect or fix is incomplete; pairing also makes the output useful to the blue-team audience and reduces the marginal value of the output to a bad actor who already knows the technique.

**Explicit out-of-scope refusals:** The skill explicitly refuses: producing ready-to-deploy malware, bypassing legal controls, targeting named real systems without confirmed authorization, and providing operational support for ongoing unauthorized access. These are stated at the routing layer, not deferred to the domain reference, so they cannot be bypassed by bucket selection.
