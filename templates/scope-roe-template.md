# Rules of Engagement — Scope Statement

## Engagement

| Field | Value |
|-------|-------|
| Engagement name | __________________ |
| Reference ID | __________________ |
| Start date/time (UTC) | __________________ |
| End date/time (UTC) | __________________ |
| Tester(s) | __________________ |

## Authorization

Authorization source (select one): signed-contract / written-permission / owned-asset / lab-environment / CTF

Authorization document: __________________ (filename or URL)
Authorizing party name + title: __________________
Date signed: __________________

## In-Scope Targets

| Target (IP / CIDR / domain / application) | Environment | Notes |
|-------------------------------------------|-------------|-------|
| __________________ | prod / staging / lab | __________________ |

## Explicitly Out of Scope

- __________________
- __________________
- Third-party services not listed above are out of scope by default.

## Allowed Action Classes

Mark each as ALLOWED / DENIED / REQUIRES-APPROVAL:

| Action class | Status | Conditions / constraints |
|--------------|--------|--------------------------|
| Passive reconnaissance (OSINT, DNS, headers) | __________________ | __________________ |
| Active scanning (port scan, banner grab) | __________________ | __________________ |
| Vulnerability scanning (automated) | __________________ | __________________ |
| Manual exploitation (non-destructive) | __________________ | __________________ |
| Exploitation with potential data access | __________________ | __________________ |
| Privilege escalation | __________________ | __________________ |
| Lateral movement | __________________ | __________________ |
| Social engineering / phishing | __________________ | __________________ |
| Physical access | __________________ | __________________ |
| Denial-of-service / load testing | __________________ | __________________ |

## Emergency Contacts

| Role | Name | Phone | Email |
|------|------|-------|-------|
| Primary client contact | __________________ | __________________ | __________________ |
| Technical lead (client) | __________________ | __________________ | __________________ |
| Tester escalation point | __________________ | __________________ | __________________ |

## Stop Conditions

Testing must halt immediately if any of the following occur:
1. Live customer data is accessed or exfiltrated beyond what is needed to confirm impact.
2. A production system becomes unresponsive or degraded.
3. A target outside scope is discovered to be reachable from an in-scope path — pause and notify client before proceeding.
4. __________________

On stop: notify primary contact within __ minutes, document last action taken, preserve all evidence.

## Data Handling

- Evidence (screenshots, payloads, captured data) stored at: __________________
- Encryption at rest: yes / no — method: __________________
- Retention period: __ days after report delivery
- Destruction method: __________________
- Real credentials or PII captured must be reported to client immediately and not retained beyond confirmation.
- Report transmitted via: __________________
