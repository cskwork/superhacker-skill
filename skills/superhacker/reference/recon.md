# Reconnaissance & Vulnerability Discovery (recon)
Scope and footprint a target, enumerate attack surface, discover and triage vulnerabilities. Posture: offensive (authorized only).

## When to route here
- Scope/footprint a target or organization
- OSINT, asset discovery, subdomain enumeration
- Port/service/version scanning
- Vulnerability scanning and triage
- Attack surface mapping

Not for: active exploitation of found vulns -> route to web-api or redteam instead.

## Authorization
Requires written, signed Rules of Engagement (RoE) with explicit in-scope IP ranges, domains, and permitted scan types before ANY active action. Passive OSINT against public data may proceed first; escalate to active scanning only after RoE confirmed. Refuse if scope is undefined or verbal-only.

## Covers
Reconnaissance, Vulnerability Management, Attack Surface Management

## Workflow
1. **Passive OSINT** - public DNS, WHOIS, certificate transparency (crt.sh), Shodan, theHarvester; no packets to target
2. **Subdomain/asset enumeration** - amass, subfinder against in-scope domains
3. **Port + service scan** - nmap/masscan on in-scope IP ranges; service version detection
4. **Vulnerability scan** - nuclei (template-based), OpenVAS/Nessus against enumerated services
5. **Triage** - score findings by CVSS base score + exploitability (public PoC, attack complexity, privileges required)
6. **Prioritized target list** - rank by CVSS >= 7.0 + confirmed reachability + exploitability

## Tools
| Tool | Purpose |
|------|---------|
| nmap | Port, service, version, OS detection |
| masscan | High-rate port sweep (large ranges) |
| amass / subfinder | Subdomain enumeration |
| theHarvester | Email, subdomain, host OSINT |
| nuclei | Template-based vuln scanning |
| OpenVAS / Nessus | Full authenticated vuln scanning |
| Shodan | Passive internet-facing asset discovery |

## Verification
- Confirm each open port with a second nmap probe before reporting
- Reproduce each vuln finding manually or with a second scanner; do not report on scanner output alone
- Validate CVSS score against NVD entry; note if PoC exists in public sources (ExploitDB, GitHub)
- Document scan timestamps, source IP, and tool version for audit trail

## Framework mappings
| ID | Reference |
|----|-----------|
| ATT&CK TA0043 | Reconnaissance |
| ATT&CK TA0042 | Resource Development |
| CVSS v3.1 | Vuln scoring (Base + Temporal) |
| OWASP WSTG-INFO | Information Gathering |
| NIST SP 800-115 | Technical Guide to IS Testing |

## Deliverable
- **Scope summary**: confirmed in-scope assets, IPs, domains
- **Attack surface map**: open ports, services, versions, certificates
- **Vulnerability inventory**: CVE ID, CVSS score, affected asset, evidence screenshot/output
- **Prioritized target list**: ranked by CVSS + exploitability + exposure
- **Remediation guidance**: patch version, config fix, or compensating control per finding
- **Detection guidance**: log sources and signatures defenders should monitor for each finding class
