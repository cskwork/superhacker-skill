# Mobile Security (mobile)
Android/iOS app analysis, mobile pentest, MASVS control assessment, MDM forensics. Posture: both (passive-first, escalate only when in-scope).

## When to route here
- APK/IPA reverse engineering or static analysis
- Dynamic instrumentation of a mobile app (Frida, objection)
- MASVS/MASTG control gap assessment
- Mobile pentest scoping or execution
- MDM bypass, mobile forensics, data-at-rest/in-transit review

Not for: server-side APIs the mobile app calls -> route to web-api instead.

## Authorization
Passive-first (static analysis, traffic inspection on owned device) requires no extra gate. Active instrumentation, dynamic analysis, or MDM testing requires written in-scope Rules of Engagement naming the app bundle ID and test device before proceeding. Refuse active actions without it.

## Covers
Mobile Security

## Workflow
1. Static analysis — decompile APK (jadx, apktool) or IPA; review manifest, permissions, hardcoded secrets, exported components.
2. Dynamic instrumentation — attach Frida/objection; hook crypto, auth, and storage APIs; bypass certificate pinning if authorized.
3. MASVS control check — map findings to MASVS-L1/L2 controls (storage, crypto, network, code, resiliency).
4. Data storage/transport assessment — inspect SharedPreferences, Keychain, SQLite, logs, TLS configuration.
5. Remediation — map each gap to a concrete fix and the corresponding MASTG test case.

## Tools
- MobSF — automated static and dynamic analysis
- jadx — APK decompilation to Java/Kotlin
- apktool — APK disassembly and repackaging
- Frida — dynamic instrumentation framework
- objection — runtime mobile exploration (Frida-based)

## Verification
- Static finding: reproduce by locating the exact class/method/line in jadx output; screenshot decompiled source.
- Dynamic finding: attach Frida script, capture console output or intercepted value; record session log.
- Network finding: capture with proxy (e.g., Burp); show raw request/response diff with and without control.
- Each finding must be reproducible on the stated app version and device OS; note build hash.

## Framework mappings
| ID | Source |
|---|---|
| MASVS-STORAGE-1/2 | OWASP MASVS v2 |
| MASVS-CRYPTO-1/2 | OWASP MASVS v2 |
| MASVS-NETWORK-1/2 | OWASP MASVS v2 |
| MASVS-CODE-1–4 | OWASP MASVS v2 |
| MASVS-RESILIENCE-1–4 | OWASP MASVS v2 |
| T1406, T1417, T1430 | ATT&CK Mobile |

## Deliverable
- Executive summary: app, version, OS, test scope, overall MASVS compliance level.
- Finding table: ID, MASVS control, severity, evidence (file path or hook output), affected versions.
- Remediation guidance: per finding — code-level fix, MASTG test case reference, and regression test recommendation.
- Detection guidance: where applicable, log event or MDM policy that would surface the weakness in production.
