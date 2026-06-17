# SOC, Detection Engineering & Threat Hunting (soc-detect)
Fires when the task involves detecting, hunting, or operationalizing alerts against attacker activity; posture: defensive.

## When to route here
- SIEM query writing, log parsing, alert triage
- Sigma/YARA/EQL rule authoring or tuning
- Threat hunting hypothesis design and execution
- LOTL/behavioral analytics, living-off-the-land detection
- SOC playbook creation or refinement
- Detection coverage gap analysis

Not for: active adversary emulation or attack simulation -> route to `redteam` instead.

## Authorization
Assumes read-only access to owned/authorized log data and environments. Do not query production systems outside authorized scope. Passive analysis first; escalate active hunting queries only when scope permits.

## Covers
SOC Operations, Security Operations, Threat Hunting

## Workflow
1. Define hunt hypothesis or detection use-case (ATT&CK technique, observed indicator, behavioral pattern)
2. Identify relevant log sources and telemetry (Sysmon, EDR, network, auth logs)
3. Query logs to validate hypothesis and scope activity
4. Build or tune detection rule (Sigma for SIEM-agnostic, EQL for Elastic, SPL for Splunk)
5. Triage results; cut false positives with baseline and allowlist logic
6. Validate rule fires on known-good test data without flooding
7. Operationalize: write playbook, map to ATT&CK, assign severity and response actions

## Tools
Splunk (SPL), Elastic/OpenSearch (EQL/KQL), Sigma (rule authoring), YARA (file/memory matching), Sysmon (Windows telemetry), Velociraptor (live hunting, artifact collection), Jupyter/hunting notebooks, MITRE ATT&CK Navigator

## Verification
- Replay a known-malicious sample or log fixture and confirm rule fires
- Confirm rule does NOT fire on a clean baseline (false-positive rate)
- Peer-review Sigma rule logic before SIEM deployment
- Document true-positive evidence: log line, field values, timestamp, host

## Framework mappings
| Framework | IDs |
|---|---|
| MITRE ATT&CK | Detection coverage mapped per technique (e.g., T1059, T1078, T1003) |
| MITRE D3FEND | D3-PM (Process Monitoring), D3-NTA (Network Traffic Analysis), D3-UAM (User Activity Monitoring) |
| NIST CSF | DE.AE, DE.CM, DE.DP |

## Deliverable
- Hunt report: hypothesis, log sources queried, findings, false-positive rate
- Detection rule file (Sigma/YARA/EQL) with inline comments
- ATT&CK technique coverage tag(s)
- Playbook: trigger condition, triage steps, escalation path, containment action
- Tuning notes: fields used, baseline exclusions, recommended review cadence
