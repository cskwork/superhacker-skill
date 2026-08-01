# Threat Intelligence (threat-intel)
Defensive domain: manage intelligence requirements, collect and normalize IOCs/IOAs, attribute adversary campaigns, and disseminate actionable intel from owned or authorized data sources.

## When to route here
- CTI program setup, intelligence requirements (IRs) definition
- IOC/IOA ingestion, deduplication, lifecycle management
- STIX/TAXII feed configuration, MISP event management
- Feed profiling, source quality scoring, false-positive tuning
- Actor/campaign attribution (Diamond Model, kill-chain mapping)
- Threat landscape briefings, intel-to-detection handoffs

Not for: active threat hunting on live telemetry -> route to soc-detect instead.

## Authorization
Defensive posture. All collection and enrichment operates on owned data or licensed/OSINT feeds. Do not query external enrichment APIs with data subject to data-residency or PII restrictions without confirming authorization. Passive-first; escalate access only when explicitly in scope.

## Covers
Threat Intelligence

## Workflow
1. Define intelligence requirements (IRs): priority intelligence questions, consumers, SLA
2. Collect: ingest OSINT feeds, commercial feeds, ISAC shares, internal telemetry via TAXII pull or MISP sync
3. Normalize: parse to STIX 2.1 objects (Indicator, Malware, Threat Actor, Campaign, Relationship)
4. Enrich + correlate: pivot on IOC across VirusTotal, passive DNS, WHOIS, sandbox reports; link to existing campaigns
5. Attribute: map TTPs to ATT&CK Groups; apply Diamond Model (adversary/capability/infrastructure/victim); place on kill-chain stage
6. Disseminate: push actionable indicators to SIEM/EDR; publish STIX bundles via TAXII; deliver finished intel reports to stakeholders

## Tools
| Tool | Role |
|---|---|
| MISP | Threat sharing platform, IOC lifecycle, feed management |
| OpenCTI | Graph-based CTI platform, STIX-native |
| STIX/TAXII | Structured representation + transport protocol |
| VirusTotal | IOC enrichment, file/URL/IP reputation |
| Commercial feeds | CrowdStrike Intel, Recorded Future, Mandiant, etc. |
| OSINT feeds | AlienVault OTX, abuse.ch, Feodo Tracker, URLhaus |

## Verification
- Confirm IOC freshness: check `valid_from`/`valid_until` in STIX object; reject expired indicators
- Cross-validate each IOC across at least two independent sources before escalating confidence
- Reproduce attribution by independently mapping the same TTP cluster to the same ATT&CK Group
- Validate TAXII collection integrity: compare object counts and `spec_version` after each sync
- Test detection handoff: confirm SIEM/EDR ingested the indicator and fired on a benign replay in a lab environment

## Framework mappings
| Framework | Relevant references |
|---|---|
| ATT&CK | Groups (G-IDs), Software (S-IDs), Technique TTPs per campaign |
| Diamond Model | Adversary, Capability, Infrastructure, Victim axes |
| Lockheed Cyber Kill Chain | Stage tagging on each IOC (Recon through Actions on Objectives) |
| STIX 2.1 | SCO types: Indicator, Malware, Threat-Actor, Campaign, Relationship, Sighting |
| NIST CSF | ID.RA (Risk Assessment), RS.AN (Analysis) |

## Deliverable
- **Intelligence Requirements register**: prioritized questions, assigned analyst, review cadence
- **IOC report**: indicator, confidence score, source, STIX ID, kill-chain stage, expiry
- **Campaign attribution brief**: actor cluster, Diamond Model summary, ATT&CK Group mapping, key TTPs
- **Detection guidance**: SIEM/EDR rules or sigma signatures derived from campaign TTPs; mapped to ATT&CK technique IDs
- **Feed quality scorecard**: source, volume, false-positive rate, freshness, recommended action (keep/tune/drop)
