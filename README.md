# superhacker-skill

A single-intent-routing security skill for Claude Code and compatible agents. One `SKILL.md` accepts a security objective and routes it to exactly one of 13 domain reference files, each consolidating several of the 26 upstream domains. The design mirrors the supergoal-skill routing pattern: minimal ceremony, one load per invocation, no broad context dumping.

**Live page (EN/KO):** https://cskwork.github.io/superhacker-skill/

---

## Authorized use only

This skill is for authorized penetration testing, CTF competitions, isolated lab environments, security research, and defensive engineering. You must have explicit written permission before using any offensive technique against any system you do not own. The authorization gate is mandatory and non-negotiable. Misuse for unauthorized access, data exfiltration, or disruption is illegal and outside the scope of this skill.

---

## Domains

| Key | Title | Posture | Covers |
|---|---|---|---|
| recon | Reconnaissance & Vulnerability Discovery | offensive | Reconnaissance, Vulnerability Management, Attack Surface Management |
| web-api | Web & API Exploitation | offensive | Web Application Security, API Security |
| network | Network & OT/ICS Security | both | Network Security, OT/ICS Security |
| redteam | Red Team & Adversary Emulation | offensive | Red Teaming, Penetration Testing, Active Directory Attack, Phishing Simulation |
| cloud-container | Cloud & Container Security | both | Cloud Security, Container Security |
| identity | Identity, Access & Zero Trust | defensive | Identity & Access Management, Zero Trust Architecture |
| appsec | AppSec, DevSecOps & Cryptography | defensive | DevSecOps, Cryptography |
| soc-detect | SOC, Detection Engineering & Threat Hunting | defensive | SOC Operations, Security Operations, Threat Hunting |
| threat-intel | Threat Intelligence | defensive | Threat Intelligence |
| incident-response | Incident Response, Ransomware & Phishing | defensive | Incident Response, Ransomware Defense, Phishing Defense (response) |
| forensics | Digital Forensics & Malware Analysis | defensive | Digital Forensics, Malware Analysis |
| mobile | Mobile Security | both | Mobile Security |
| govern | Compliance, Governance & Deception | defensive | Compliance & Governance, Deception Technology |

---

## How routing works

1. You provide a security objective (e.g., "enumerate subdomains", "write a YARA rule", "harden IAM policies").
2. `SKILL.md` matches the intent against the routing table and selects exactly one domain key.
3. The corresponding reference file under `reference/` is loaded into context.
4. The agent works within that single reference. No other domains are loaded unless you start a new request.

This keeps context tight and prevents cross-domain noise from diluting technique depth.

---

## Install

This directory is a Claude Code skill. The entry point is `SKILL.md`. To use it, add this directory to your agent's skill path or reference `SKILL.md` directly. No additional dependencies are required beyond a Claude Code-compatible agent runtime.

---

## Attribution & responsible use

Inspired by [mukul975/Anthropic-Cybersecurity-Skills](https://github.com/mukul975/Anthropic-Cybersecurity-Skills) (Apache-2.0). This project is not affiliated with Anthropic. Domain consolidation, routing architecture, and reference content are independently authored.

Use of this skill is solely your responsibility. The authors accept no liability for misuse. Always operate within the law and within the scope of explicit authorization.
