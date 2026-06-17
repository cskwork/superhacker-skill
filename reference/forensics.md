# Digital Forensics & Malware Analysis (forensics)
Defensive domain: disk/memory imaging, artifact analysis, malware triage, and forensic reporting on owned or in-scope systems.

## When to route here
- Disk or memory imaging request, chain-of-custody question
- Timeline reconstruction from filesystem, registry, or log artifacts
- Malware sample triage: static analysis, dynamic sandbox, reverse engineering
- Volatility3 memory analysis, YARA rule authoring or scanning
- Forensic report generation after incident

Not for: active incident containment or ransomware response -> route to `incident-response` instead.

## Authorization
Defensive / read-only assumption. Only analyze systems, images, and samples you own or have explicit written authorization to examine. Treat all artifacts as evidence: document acquisition method and maintain chain of custody before touching any data.

## Covers
Digital Forensics, Malware Analysis

## Workflow
1. **Preserve** — write-block source media; hash (SHA-256) before and after imaging.
2. **Image** — full disk image (dd/dcfldd) or memory dump (WinPmem/LiME); record chain of custody.
3. **Artifact analysis** — parse filesystem, registry, browser, prefetch, LNK, MFT with Autopsy/Sleuth Kit or KAPE collection packs.
4. **Memory analysis** — run Volatility3 plugins (pslist, netscan, malfind, cmdline, dlllist) against the memory image.
5. **Timeline reconstruction** — merge filesystem MAC times, event logs, and artifact timestamps into a unified timeline.
6. **Malware triage (static)** — strings, PE header, imports, YARA scan, Ghidra disassembly on the isolated sample.
7. **Malware triage (dynamic)** — detonate in Cuckoo or an isolated sandbox; capture network, registry, and file I/O behavior.
8. **Map to ATT&CK** — tag each behavior and artifact to MITRE technique IDs.
9. **Forensic report** — document findings with reproducible evidence hashes (see Deliverable).

## Tools
| Tool | Purpose |
|---|---|
| Volatility3 | Memory forensics: process, network, malware artifacts |
| Autopsy / Sleuth Kit | Disk forensics: file system parsing, artifact extraction |
| KAPE | Triage collection: targeted artifact acquisition |
| YARA | Pattern-based malware signature scanning |
| Ghidra | Static reverse engineering / disassembly |
| Cuckoo / sandbox | Dynamic malware execution in isolation |

## Verification
- Recompute SHA-256 of every image and compare to acquisition hash before analysis.
- Reproduce each Volatility3 or Autopsy finding by re-running the same plugin/query against the same image.
- Confirm YARA hits with a second scan using a different tool (e.g., `yara` CLI then Autopsy YARA module).
- For sandbox reports: cross-validate dynamic indicators (network IOCs, file drops) against static strings and Ghidra analysis.
- All findings must cite image hash, plugin/tool version, and exact command used.

## Framework mappings
| Framework | Reference |
|---|---|
| MITRE ATT&CK | Map each artifact/behavior to Tactic + Technique IDs (e.g., T1059, T1055) |
| NIST SP 800-86 | Guide to Integrating Forensic Techniques into Incident Response |
| Chain-of-custody | SWGDE / ISO/IEC 27037 evidence handling standards |

## Deliverable
Forensic report sections:
1. **Case summary** — scope, systems examined, acquisition dates, examiner
2. **Evidence inventory** — item list with SHA-256 hashes and custody log
3. **Timeline** — chronological artifact sequence with source citations
4. **Malware findings** — static + dynamic analysis, IOCs (hashes, IPs, domains, registry keys)
5. **ATT&CK mapping table** — tactic / technique / evidence for each behavior
6. **Detection guidance** — YARA rules, SIEM queries, or EDR signatures derived from findings
7. **Remediation guidance** — persistence mechanisms to remove, accounts to reset, network blocks to apply
