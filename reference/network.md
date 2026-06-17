# Network & OT/ICS Security (network)
Fires on network pentest, segmentation review, traffic analysis, or OT/ICS protocol work; posture: both (passive-first).

## When to route here
- Network pentest or segmentation/VLAN review
- IDS/IPS tuning or traffic analysis
- OT/ICS protocols: Modbus, DNP3, EtherNet/IP, PROFINET
- SCADA/HMI exposure assessment
- IEC 62443 gap analysis

Not for: host/service exploitation -> route to `redteam` instead.

## Authorization
Passive-first. Escalate to active scanning or protocol fuzzing only when written in-scope RoE confirms the target network and any OT/ICS assets. For OT/ICS: confirm maintenance window and change-freeze status before any active probe; unsanctioned active scans can trip physical safety systems.

## Covers
Network Security, OT/ICS Security

## Workflow
1. Map topology + segmentation: enumerate VLANs, firewall zones, trust boundaries, DMZs
2. Passive traffic analysis: capture and baseline protocols before any active step (critical for OT)
3. Identify exposure/misconfiguration: open cross-zone paths, unencrypted industrial protocols, weak auth
4. Active enumeration (in-scope only): nmap NSE scripts against IT targets; read-only Modbus/DNP3 queries against OT
5. Harden + segment recommendations: draft remediation prioritized by impact and operational risk

## Tools
- Wireshark / tshark — packet capture and protocol dissection
- Zeek — passive network metadata and protocol logging
- Suricata — IDS/IPS rule validation and traffic alerting
- nmap NSE — service fingerprinting and targeted script checks (IT segments only)
- IEC 62443 checklists — control-system security requirement mapping

## Verification
- Topology findings: corroborate with two independent sources (capture + device config review)
- Segmentation gap: confirm bidirectional traffic proves the path (not just one packet)
- OT protocol exposure: replay read-only function code in lab before reporting; document exact frame captured
- IDS/IPS gap: trigger a known benign rule and confirm alert fires; absence of alert = verified gap

## Framework mappings
| Finding type | Framework | IDs |
|---|---|---|
| Lateral movement paths | ATT&CK for ICS | T0886, T0849, T0885 |
| OT network segmentation | IEC 62443 | SR 5.1, SR 5.2 |
| Protective technology | NIST CSF | PR.PT-4, PR.AC-5 |
| Network boundary defense | CIS Controls | CIS 12, CIS 13 |

## Deliverable
- Topology diagram with trust zones and identified cross-zone exposure
- Protocol inventory (IT and OT), flagging unencrypted or unauthenticated sessions
- Findings table: asset, exposure, evidence (pcap reference or scan output), CVSS/risk rating
- Remediation guidance: VLAN isolation, firewall rule additions, encrypted protocol migration, IDS rule sets
- Detection guidance: Zeek/Suricata signatures for each confirmed exposure
