# Install superhacker

<details>
<summary><strong>Claude Code</strong></summary>

### Install

```bash
claude plugin marketplace add cskwork/superhacker-skill
claude plugin install superhacker@superhacker
```

Type `/superhacker`.

### Verify

```bash
claude plugin list
```

### Update

```bash
claude plugin marketplace update superhacker
```

### Uninstall

```bash
claude plugin uninstall superhacker
claude plugin marketplace remove superhacker
```

</details>

<details>
<summary><strong>Codex</strong></summary>

### Install

```bash
codex plugin marketplace add cskwork/superhacker-skill --ref main
codex plugin add superhacker@superhacker
```

Type `$superhacker`.

### Verify

```bash
codex plugin list
```

### Uninstall

```bash
codex plugin remove superhacker
codex plugin marketplace remove superhacker
```

</details>

<details>
<summary><strong>Gemini CLI</strong></summary>

### Install (extension, always-on)

```bash
gemini extensions install https://github.com/cskwork/superhacker-skill
```

### Install (command, opt-in)

```bash
mkdir -p ~/.gemini/commands
curl -fsSL https://raw.githubusercontent.com/cskwork/superhacker-skill/main/skills/superhacker-skill/agents/gemini.toml \
  -o ~/.gemini/commands/superhacker.toml
```

Type `/superhacker` in a new session.

### Verify

```bash
gemini extensions list
```

### Uninstall

```bash
gemini extensions uninstall superhacker
```

</details>

<details>
<summary><strong>Cursor, OpenCode, Amp, and other agent-skills harnesses</strong></summary>

### Install

```bash
npx skills add cskwork/superhacker-skill
npx skills add cskwork/superhacker-skill -g
```

Type `/superhacker` in a new agent chat.

### Verify

```bash
npx skills list
```

### Update

```bash
npx skills update superhacker
```

### Uninstall

```bash
npx skills remove superhacker
```

</details>

<details>
<summary><strong>Antigravity (agy)</strong></summary>

### Install

```bash
agy plugin install https://github.com/cskwork/superhacker-skill
```

### Verify

```bash
agy plugin list
```

### Uninstall

```bash
agy plugin uninstall superhacker
```

</details>
