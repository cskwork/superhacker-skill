# Incident Response, Ransomware & Phishing (incident-response)
Active incident handling, containment, eradication, and recovery; posture: defensive.

## When to route here
- Active breach, ransomware detonation, or confirmed phishing compromise
- Containment or isolation decisions (host, network, account)
- Evidence preservation and chain-of-custody requirements
- BEC (business email compromise) or phishing campaign response
- IR playbook execution or post-incident review

Not for: suspected-but-unconfirmed threat hunting -> route to `soc-detect` instead.

## Authorization
Defensive/owned-data assumption. All actions apply only to systems and data the organization owns or has written authorization to examine. Treat all evidence as legally sensitive; preserve chain of custody before any remediation.

## Covers
Incident Response, Ransomware Defense, Phishing Defense (response)

## Workflow
1. **Triage + scope** — confirm incident is real; classify severity; identify affected systems, accounts, and data
2. **Contain** — isolate hosts via EDR or network ACL; disable compromised accounts; preserve forensic images before wiping
3. **Eradicate** — remove malware, persistence mechanisms, and attacker footholds; patch or rebuild compromised assets
4. **Recover + validate** — restore from clean backups; verify integrity; confirm re-infection indicators are gone
5. **Lessons-learned report** — root-cause analysis, timeline, control gaps, remediation owners, detection rule updates

## Tools
| Tool | Purpose |
|---|---|
| KAPE | Rapid triage artifact collection (Windows) |
| Velociraptor | Endpoint artifact hunting at scale |
| EDR isolate | Network-isolate a host while retaining agent comms |
| SPF/DKIM/DMARC analysis | Validate or reconstruct email authentication path |
| IR playbooks | Pre-defined decision trees per incident type |

## Verification
- Cross-reference IOCs (hashes, IPs, domains) against at least two independent threat intel sources before asserting attribution
- Confirm eradication by re-running the same detection rule/query that originally fired; must return zero hits on the cleaned asset
- Validate backup integrity with a test restore to an isolated environment before declaring recovery complete
- For phishing: confirm DMARC enforcement is set to `reject` or `quarantine` and re-send a test message to verify headers

## Framework mappings
| Framework | IDs |
|---|---|
| NIST SP 800-61 | Preparation, Detection & Analysis, Containment/Eradication/Recovery, Post-Incident |
| SANS PICERL | Preparation, Identification, Containment, Eradication, Recovery, Lessons Learned |
| NIST CSF | RS.RP, RS.CO, RS.AN, RS.MI, RC.RP, RC.IM |
| MITRE ATT&CK | Respond: use technique IDs from triage to drive containment scope |

## Deliverable
- **Executive summary** — what happened, business impact, current status
- **Timeline** — attacker activity reconstructed from logs and artifacts
- **IOC list** — hashes, IPs, domains, email addresses, persistence keys
- **Root-cause analysis** — initial access vector and control failure
- **Remediation actions taken** — with timestamps and owners
- **Detection/prevention guidance** — new SIEM rules, EDR policies, email auth enforcement, patching requirements
- **Lessons-learned recommendations** — control gaps with prioritized remediation owners and target dates
