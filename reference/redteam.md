# Red Team & Adversary Emulation (redteam)
Authorized emulation of named threat actor TTPs to expose detection gaps; posture: offensive.

## When to route here
- Red team op or full adversary emulation engagement
- Active Directory attack path enumeration or exploitation (Kerberoasting, DCSync, Pass-the-Hash)
- Privilege escalation or lateral movement simulation
- Phishing simulation (authorized campaign)
- C2 framework operation under licensed, authorized use
- MITRE ATT&CK kill-chain execution in-scope

Not for: standalone vulnerability discovery without adversary emulation -> route to **recon** instead.

## Authorization
**HARD GATE**: obtain written Rules of Engagement (RoE) and explicit scope before any active action. RoE must define in-scope targets, permitted TTPs, data-handling rules, and emergency stop contacts. Refuse engagement if RoE is missing, unsigned, or out-of-date. No persistence, no real damage, no exfiltration of live data outside scope.

## Covers
Red Teaming, Penetration Testing, Active Directory attack paths, Phishing simulation, C2 operation (authorized).

## Workflow
1. Confirm written RoE, objectives, and scope (HARD GATE — do not proceed without this)
2. Threat-profile selection: map named adversary or ATT&CK group to in-scope TTPs
3. Initial access emulation: phishing sim, credential stuffing, or assumed-breach as defined in RoE
4. Enumeration: AD object graph (BloodHound), live host/service map
5. Privilege escalation: exploit paths identified via enumeration; no uncontrolled lateral spread
6. Lateral movement: move only to in-scope hosts; document each hop
7. Objective completion: reach defined target (Domain Admin, data access) per RoE
8. Document every step with timestamp, command, and the detection opportunity it creates
9. Clean up: remove implants, artifacts, and accounts created during op
10. Purple-team handoff: share IOCs, TTPs, and detection-gap findings with blue team

## Tools
| Tool | Purpose |
|------|---------|
| BloodHound | AD attack path visualization and enumeration |
| Impacket | AD protocol exploitation (Kerberoasting, DCSync, SMB relay) |
| CrackMapExec | Network-wide credential testing and lateral movement |
| Sliver / Cobalt Strike | C2 framework (licensed + authorized only) |
| Atomic Red Team | Atomic TTP execution mapped to ATT&CK technique IDs |

## Verification
- Each finding must be reproducible with exact command, target, and precondition documented
- Screenshot or log output required for every ATT&CK technique claimed
- Confirm impact is bounded: no unintended hosts affected, no production data exfiltrated
- Re-run Atomic tests in lab to validate detection rule fires before reporting gap as undetected

## Framework mappings
| Framework | Relevant IDs |
|-----------|-------------|
| MITRE ATT&CK | Full kill chain: TA0001–TA0011 (Initial Access through Impact) |
| MITRE ATT&CK | Key techniques: T1078 (Valid Accounts), T1059 (Command Scripting), T1003 (Credential Dumping), T1021 (Remote Services), T1550 (Use Alternate Auth) |
| MITRE ATLAS | AI system adversarial emulation (when AI/ML systems are in scope) |
| NIST SP 800-115 | Technical guide to information security testing |
| PTES | Penetration Testing Execution Standard phases |

## Deliverable
- **Executive summary**: objectives, scope, overall risk rating
- **Attack narrative**: chronological kill chain with timestamps and ATT&CK technique IDs
- **Findings**: each finding includes technique ID, evidence, business impact, reproduction steps
- **Detection gaps**: for each finding, identify which detection control was absent or bypassed
- **Remediation guidance**: prioritized by exploitability and impact
- **Purple-team handoff packet**: IOCs, detection rules (Sigma/Yara/SIEM queries), and recommended coverage improvements
