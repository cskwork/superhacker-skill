# Changelog - 2026-07-03

## Vulnerability clue hints spec

### Decision

Implemented and documented a `clue-hunt` route for `/superhacker`, backed by `docs/specs/2026-07-03-vulnerability-clue-hints.md`.

### Goal

Improve the skill for prompts like "find vulnerability clues", "give bug bounty hints", or "where should I look in this repo" without weakening the existing evidence-backed reporting contract. The real-world activity is triage: observe signals, form hypotheses, rank validation steps, and promote only reproduced issues to findings.

### Strix pattern borrowed

Strix's public docs emphasize source-aware mapping, specialized security skill packets, browser/proxy/terminal evidence surfaces, configurable scan depth, custom instructions, and proof-based validation. The proposed `/superhacker` change borrows that clue-to-validation shape but keeps the local skill independent from Strix runtime dependencies. The spec records the Strix repository and docs pages it used as source references.

### Recommended design

Added a new `reference/clue-hunt.md` route instead of folding the workflow into existing domains. The route is passive by default and outputs a clue ledger, ranked validation queue, rejected clues, not-tested areas, and confirmed findings only when evidence exists.

This preserves the current one-reference-per-invocation contract: clue discovery is one route; later validation is handed to the appropriate existing domain route.

### Implementation

- Added `reference/clue-hunt.md` with authorization, workflow, scan-depth, verification, and deliverable rules.
- Added `templates/clue-ledger-template.md` so clues, hypotheses, validation status, and confirmed findings have distinct fields.
- Updated `SKILL.md`, README, and the bilingual landing page to expose the new route.
- Extended `tests/superhacker-contract.test.sh` to require the clue route, clue ledger template, clue-vs-finding separation rule, validation-state vocabulary, and active-validation gate.
- Tightened the frontmatter description into a short routing hook. Rejected keeping the full workflow and every domain synonym there because the body and route table are the single source of truth for execution details.

### Alternatives rejected

- Folding clue hunting into `recon`, `appsec`, and `web-api`: rejected because the clue-vs-finding distinction would be duplicated and drift across domains.
- Making Strix CLI the default workflow: rejected because this repository is a skill, not a Docker/API-key tool wrapper.
- Reporting "likely vulnerabilities" directly: rejected because it encourages false positives and conflicts with the current evidence-backed reporting principle.

### Safety rationale

The spec keeps authorization-first as the first gate. Passive review of owned/provided artifacts can produce clues and validation plans. Live target testing, request replay, exploit validation, credential testing, and destructive checks remain blocked unless explicit scope and rules of engagement are present.
