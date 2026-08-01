# Vulnerability Clue Discovery (clue-hunt)

Find source-aware and behavior-aware vulnerability clues, rank hypotheses, and prepare least-impact validation plans. Posture: passive-first; active validation requires authorization.

## When to route here

- User asks for vulnerability clues, hints, leads, likely bug locations, bug bounty ideas, or source-aware triage.
- User provides a repo, route map, dependency list, CI output, config set, request log, proxy export, or app behavior description and wants likely security leads.
- User wants to prioritize validation work before running active tests.
- User asks for a Strix-style clue pass without requiring Strix itself.

Not for: confirming or exploiting a specific web/API vulnerability -> route to `web-api`; CI security gates -> route to `appsec`; external attack surface enumeration -> route to `recon`.

## Authorization

Passive review of owned source, logs, configs, dependencies, and user-provided artifacts may proceed. Active scanning, request replay, browser testing against a live target, exploit validation, credential testing, and destructive checks require explicit scope and rules of engagement. If active authorization is absent, stop at a validation plan.

## Covers

- Source-aware vulnerability clue discovery
- Bug bounty lead triage
- Cross-domain hypothesis ranking
- Least-impact validation planning

## Workflow

1. State scope, authorization status, and scan depth (`quick`, `standard`, or `deep`). Default to `standard`.
2. Inventory evidence surfaces: source files, routes, auth boundaries, inputs, sinks, dependencies, configs, traffic, roles, and state-changing actions.
3. Harvest signals by category: access control, injection, SSRF, file/path handling, auth/session, business logic, secrets/config, supply chain, cloud/container, client-side, race/state.
4. Convert each signal into a hypothesis with a clear chain: signal -> possible vulnerability class -> required preconditions -> missing proof.
5. Score each hypothesis by reachability, likely impact, confidence, validation cost, and authorization status.
6. Build a validation queue from least-impact to higher-impact checks. Passive checks first; active checks only if scope permits.
7. Route confirmed next-step work to the right existing domain: `web-api`, `appsec`, `cloud-container`, `identity`, `recon`, `redteam`, `mobile`, or `network`.

## Scan depth

| Depth | Use when | Evidence surfaces |
|---|---|---|
| quick | User wants fast hints or a small target set | Routes, auth checks, input sinks, secrets, dangerous dependencies |
| standard | User does not specify depth | Quick plus config, CI, role boundaries, state-changing flows, error handling |
| deep | User wants a thorough clue pass | Standard plus cross-file data flow, race/state clues, chained hypotheses, dependency advisories |

## Tools

| Tool / surface | Purpose |
|---|---|
| Code search / code graph | Map routes, handlers, sinks, auth checks, and data flow |
| Package manager metadata | Identify vulnerable or risky dependencies |
| Semgrep / CodeQL | Support static hypotheses with repeatable rule evidence |
| gitleaks / trufflehog | Detect secret presence without exposing values |
| Proxy logs / HAR files | Link requests to roles, parameters, and state changes |
| Browser devtools | Observe client-side route and storage behavior when authorized |

## Verification

- Do not promote a clue to a finding without reproduction evidence.
- Do not rely on scanner output alone; require a second source or manual reasoning.
- Mark each hypothesis as one of: `needs-info`, `passive-only`, `ready-for-authorized-validation`, `rejected`, `confirmed-finding`.
- Redact secrets. Report secret presence, location, and rotation guidance without exposing the value.
- Record why a clue was rejected so future runs do not rediscover the same false positive.
- If active testing is not authorized, keep commands/actions at the planning level and route validation to the right domain for a future scoped run.

## Framework mappings

| ID | Reference |
|---|---|
| OWASP WSTG-INFO | Information gathering and mapping |
| OWASP ASVS | Verification requirements for auth, access control, input handling |
| OWASP Top 10 2021 | Common vulnerability classes |
| OWASP API Security Top 10 2023 | API clue classification |
| CWE | Weakness classification |
| CVSS v3.1 | Severity scoring only after validation |

## Deliverable

Start with:

```markdown
Scope: [objective] | Authorization: [owned-source / lab / RoE / passive-only / blocked] | Mode: clue-hunt
```

Then deliver:

- **Evidence surface inventory**: what was reviewed and what was not available.
- **Clue ledger**: use `templates/clue-ledger-template.md`; label signals, hypotheses, and findings separately.
- **Ranked validation queue**: least-impact next checks, authorization status, and routed domain for each check.
- **Confirmed findings**: only reproduced issues, using `templates/finding-template.md`.
- **Rejected / low-confidence clues**: reason for rejection or missing proof.
- **Not tested**: excluded, unavailable, or unauthorized areas.
