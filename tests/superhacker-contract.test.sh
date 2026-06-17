#!/usr/bin/env bash
# /superhacker contract test.
# Fails if SKILL.md is missing required structure, reference files are absent,
# templates are missing, or domain reference files lack mandatory section headings.

set -u

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PASS=0
FAIL=0

require_text() {
  local label="$1" file="$2" text="$3"
  local normalized
  normalized="$(tr '\n\t\r' '   ' < "$ROOT/$file" | tr -s ' ')"
  if printf '%s' "$normalized" | grep -Fqi -- "$text"; then
    PASS=$((PASS + 1)); printf '  PASS  %s\n' "$label"
  else
    FAIL=$((FAIL + 1)); printf '  FAIL  %s\n' "$label"; printf '        missing in %s: %s\n' "$file" "$text"
  fi
}

require_file() {
  local label="$1" file="$2"
  if [ -f "$ROOT/$file" ]; then
    PASS=$((PASS + 1)); printf '  PASS  %s\n' "$label"
  else
    FAIL=$((FAIL + 1)); printf '  FAIL  %s\n' "$label"; printf '        missing file: %s/%s\n' "$ROOT" "$file"
  fi
}

echo "=================================================================="
echo " /superhacker contract   skill: $ROOT"
echo "=================================================================="

# SKILL.md exists and frontmatter has correct name.
require_file  "SKILL.md exists"                        "SKILL.md"
require_text  "frontmatter name: superhacker"          "SKILL.md" "name: superhacker"

# Hard gate and engagement loop present.
require_text  "SKILL.md mentions Authorization gate"   "SKILL.md" "Authorization"
require_text  "SKILL.md mentions Engagement loop"      "SKILL.md" "Engagement loop"

# SKILL.md routing references every domain reference file.
DOMAINS="recon web-api network redteam cloud-container identity appsec soc-detect threat-intel incident-response forensics mobile govern"
for domain in $DOMAINS; do
  require_text "SKILL.md routes to reference/$domain.md" "SKILL.md" "reference/$domain.md"
done
require_text  "SKILL.md routes to reference/authorization.md" "SKILL.md" "reference/authorization.md"

# Every referenced domain file exists on disk.
for domain in $DOMAINS; do
  require_file "reference/$domain.md exists" "reference/$domain.md"
done
require_file  "reference/authorization.md exists" "reference/authorization.md"

# Template files exist.
require_file  "templates/report-template.md exists"        "templates/report-template.md"
require_file  "templates/scope-roe-template.md exists"     "templates/scope-roe-template.md"
require_file  "templates/finding-template.md exists"       "templates/finding-template.md"

# Every domain reference file contains the four mandatory section headings.
ALL_DOMAINS="$DOMAINS"
for domain in $ALL_DOMAINS; do
  ref="reference/$domain.md"
  if [ -f "$ROOT/$ref" ]; then
    require_text "$domain.md has '## When to route here'"  "$ref" "## When to route here"
    require_text "$domain.md has '## Authorization'"       "$ref" "## Authorization"
    require_text "$domain.md has '## Workflow'"            "$ref" "## Workflow"
    require_text "$domain.md has '## Verification'"        "$ref" "## Verification"
  else
    FAIL=$((FAIL + 1)); printf '  FAIL  %s: file absent, skipping heading checks\n' "$ref"
  fi
done

printf '\nSummary: %s passed, %s failed\n' "$PASS" "$FAIL"
[ "$FAIL" -eq 0 ]
