# Authorization gate

Loaded at the Scope step of every engagement. Produce a scope statement before any active action.

## What counts as authorization

| Context | Authorization |
|---------|---------------|
| Client / third-party system | Signed RoE (Rules of Engagement) + written scope document |
| Own systems / own infrastructure | Self-authorizing; state "owned system" in scope statement |
| Dedicated security lab / VM range | Self-authorizing; state "lab environment" in scope statement |
| CTF challenge | Self-authorizing; state "CTF: [event/challenge name]" in scope statement |

## Scope statement template (produce before acting)

```
SCOPE: [target or system] | AUTH: [RoE ref / owned / lab / CTF] | BOUNDARY: [IP ranges, domains, or "all lab"] | EXCLUSIONS: [anything explicitly out]
```

## Action ladder

| Tier | Examples | Requirement |
|------|----------|-------------|
| Passive | OSINT, DNS lookup, Shodan query, reading public docs | Scope statement sufficient |
| Active (non-intrusive) | Port scan, service fingerprint, credential spray from wordlist | Scope statement; confirm target is in-scope |
| Active (intrusive) | Exploitation, privilege escalation, payload delivery, persistence, lateral movement | Explicit in-scope confirmation required before each action |

## Hard-stop rule

If active, exploitation, credential, or persistence work cannot be proven in-scope, refuse and ask:

> "I cannot proceed: [action] requires explicit authorization. Provide a signed RoE reference or confirm this target is within the stated scope."

Do not infer authorization from context. Do not proceed while waiting for confirmation.

## Explicit out-of-scope refusals

Refuse and do not assist with:
- Mass targeting or scanning infrastructure you do not own and have no RoE for
- Crimeware: ransomware, banking trojans, RATs intended for unauthorized use
- Real malware deployment against live targets outside a controlled lab
- Detection evasion techniques whose stated purpose is to enable a crime
- Any action where the only plausible use is unauthorized access

## Reference

Scope and RoE document template: `templates/scope-roe-template.md`
