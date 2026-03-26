---
name: writing-review
description: "Review writing through a council of literary agents (Zinsser, Hemingway, Chekhov, Wilde, etc.). Each agent applies craft principles as editorial notes. Supports blog posts, LinkedIn, Threads, speaking abstracts, and marketing copy."
user-invocable: true
---

# Writing Review

Run a draft through a council of literary agents for craft-level editing.

## Invocation

- `/writing-review` — auto-detect content type, select default panel
- `/writing-review blog-technical` — technical blog post panel
- `/writing-review blog-personal` — career/personal blog post panel
- `/writing-review linkedin` — LinkedIn post panel
- `/writing-review threads` — Threads post panel
- `/writing-review speaking` — speaking abstract panel
- `/writing-review marketing` — marketing/services copy panel
- `/writing-review hot-take` — opinion/hot take panel
- `/writing-review narrative` — storytelling/narrative panel
- `/writing-review business` — business writing panel
- `/writing-review ukrainian` — Ukrainian audience panel
- `/writing-review strategy` — strategy/positioning panel
- `/writing-review deep-tech` — deep technical essay panel
- `/writing-review polemic` — polemic/opinion panel
- `/writing-review memoir` — personal narrative panel
- `/writing-review satire` — satirical piece panel
- `/writing-review long-narrative` — long-form narrative panel
- `/writing-review career` — career reflection panel
- `/writing-review --panel hemingway,chekhov,wilde` — custom panel override

## Workflow

### Step 1: Identify the Draft

Ask the user which file to review, or accept pasted text. If a file path is given, read it. Record the original word count.

### Step 2: Select the Panel

Read `config/panels.md` for the taxonomy. Based on content type argument (or auto-detection from content):
- **Slot 1**: Zinsser (always)
- **Slot 2**: Sharpener (from taxonomy)
- **Slot 3**: Storyteller/Context (from taxonomy)
- **Slot 4**: Doctrine Check (always)

If the user passes `--panel`, use those agents plus Zinsser and Doctrine Check.

Display the panel selection:

```
╔══════════════════════════════════════════════════╗
║  WRITING COUNCIL                                 ║
╠══════════════════════════════════════════════════╣
║  Panel    blog-personal                          ║
║  Agents   Zinsser · Chekhov · Campbell · Doctrine║
║  File     src/content/blog/2026-03-19-why-im...  ║
║  Words    856                                    ║
╚══════════════════════════════════════════════════╝

Dispatching 4 agents in parallel...
```

### Step 3: Run Agents in Parallel

Launch all selected agents as parallel subagents. Each agent receives:
- The full draft text
- The content type
- The target audience (inferred from content type)
- Their agent file instructions (read from `agents/{name}.md`)
- Instructions to return findings in the structured format below

Each agent MUST return findings in this exact structure:

```
AGENT: [agent name]

FINDING:
  severity: CRITICAL | IMPROVE | POLISH
  section: [H2 heading or "opening" / "closing"]
  line: [line text quoted]
  issue: [what's wrong]
  variants:
    - label: A
      text: "[suggested edit]"
      rationale: "[why, citing the author's principle]"
    - label: B (optional — only if there's a meaningfully different approach)
      text: "[alternative edit]"
      rationale: "[why this alternative]"

STRENGTH:
  section: [heading]
  line: [line text quoted]
  why: [why this works — cite principle]
```

Key rules for agents:
- Each finding MUST include at least one variant (the suggested edit)
- Include a second variant (B) ONLY if there's a genuinely different approach, not a minor rewording
- STRENGTHS are reported separately — they are not findings
- Do not suggest edits that change the author's meaning, only how it's expressed

### Step 4: Merge Findings

After all agents complete:

1. **Deduplicate**: if multiple agents flag the same line/section, merge into one finding with combined rationale. Preserve all unique variants across agents — label them with the agent name.
2. **Sort**: CRITICAL → IMPROVE → POLISH
3. **Number**: sequential (F1, F2, F3...)
4. **Separate strengths**: collect into a single strengths section

### Step 5: Present Header

Show the merged review header as text:

```
══════════════════════════════════════════════════
 WRITING COUNCIL REVIEW
══════════════════════════════════════════════════
 Panel     Zinsser · Chekhov · Campbell · Doctrine
 Type      blog-personal
 Words     856
 Findings  3 CRITICAL · 5 IMPROVE · 4 POLISH
══════════════════════════════════════════════════
```

### Step 6: Interactive Finding Review (AskUserQuestion)

Present each finding ONE AT A TIME using a combination of text context + the `AskUserQuestion` tool.

**For each finding:**

1. **Print context as text** — the finding header, original text, agent rationale:

```
──────────────────────────────────────────────────
 F1/12                        CRITICAL · § What I built
 Agents: Zinsser + Hemingway
──────────────────────────────────────────────────

 Original:
 │ I spent the last few years building AI systems,
 │ data platforms, and engineering teams from scratch.

 Zinsser: Strip the list, lead with the concrete image.
 Hemingway: One clean sentence beats a catalogue.
──────────────────────────────────────────────────
 Applied: 0 · Skipped: 0 · Remaining: 12
──────────────────────────────────────────────────
```

2. **Call AskUserQuestion** with the variants as options:

```json
{
  "questions": [{
    "question": "F1/12 — What should happen to this line?",
    "header": "F1 CRITICAL",
    "multiSelect": false,
    "options": [
      {
        "label": "Variant A (Hemingway)",
        "description": "One clean sentence beats a catalogue",
        "preview": "## What I built\n\nAt Honeycomb Software I led ~15 engineers...\n\n> I've spent the last few years building AI\n> systems that didn't exist yet.\n\nAt GR8 Tech, I designed..."
      },
      {
        "label": "Variant B (Zinsser)",
        "description": "Tighten without losing the scope",
        "preview": "## What I built\n\nAt Honeycomb Software I led ~15 engineers...\n\n> I built AI systems, data platforms, and\n> teams — all from zero.\n\nAt GR8 Tech, I designed..."
      },
      {
        "label": "Skip",
        "description": "Keep as-is, move to next finding"
      }
    ]
  }]
}
```

**Key rules for AskUserQuestion usage:**

- **header**: Max 12 chars. Format: `"F[N] [SEV]"` — e.g., `"F1 CRITICAL"`, `"F5 IMPROVE"`, `"F12 POLISH"`
- **preview**: Show 3-5 lines of surrounding context with the variant applied (highlighted with `>`). This lets the user see how the edit reads in place. Only use preview when the edit changes text (not for structural suggestions like "split paragraph").
- **"Other"**: Always available automatically — this replaces the old `[e] edit` option. The user types their own version.
- **Max 4 options**: With 2 variants + Skip, you have room for one more option if needed. With 1 variant, use: Apply / Skip (2 options minimum).
- **Annotations**: If the user selects "Other" and adds notes, save those notes for the craft report.

**Single-variant findings** (most common):

```json
{
  "questions": [{
    "question": "F3/12 — Apply this edit?",
    "header": "F3 IMPROVE",
    "multiSelect": false,
    "options": [
      {
        "label": "Apply",
        "description": "Chekhov: trust the reader — the difficulty is self-evident",
        "preview": "...The simpler truth might be that\nI outgrew the room.\n\n## What I think about career moves..."
      },
      {
        "label": "Skip",
        "description": "Keep as-is, move to next finding"
      }
    ]
  }]
}
```

**Doctrine conflicts** — use 3 options:

```json
{
  "questions": [{
    "question": "F7/12 — Doctrine conflict: Hemingway vs Doctrine Check",
    "header": "F7 CONFLICT",
    "multiSelect": false,
    "options": [
      {
        "label": "Keep Hemingway's edit",
        "description": "Compression wins over voice consistency here",
        "preview": "...the lens sharpens faster than\nany single skill."
      },
      {
        "label": "Keep original (Doctrine wins)",
        "description": "'lens' is not in signature vocabulary — reads as borrowed"
      },
      {
        "label": "Skip",
        "description": "Neither edit, move to next"
      }
    ]
  }]
}
```

### Step 7: Between Severity Levels

When transitioning between severity levels, use AskUserQuestion for the batch decision:

Print text summary first:
```
══════════════════════════════════════════════════
 CRITICAL complete — 2 applied, 1 skipped
══════════════════════════════════════════════════
```

Then ask:

```json
{
  "questions": [{
    "question": "Moving to IMPROVE (5 findings). How do you want to proceed?",
    "header": "IMPROVE",
    "multiSelect": false,
    "options": [
      {
        "label": "Review one by one",
        "description": "See each IMPROVE finding individually"
      },
      {
        "label": "Auto-approve all",
        "description": "Apply variant A for all 5 IMPROVE findings"
      },
      {
        "label": "Skip all IMPROVE",
        "description": "Move directly to POLISH findings"
      },
      {
        "label": "Done",
        "description": "Apply approved edits and finish"
      }
    ]
  }]
}
```

### Step 8: Strengths

After all findings are reviewed (or after "Done"), show strengths as text:

```
──────────────────────────────────────────────────
 STRENGTHS — keep these
──────────────────────────────────────────────────

 ✓ "No existing platform to extend. No established
    patterns to follow. Just constraints, a team,
    and a deadline."
    — Chekhov: flat statement of absurd reality.

 ✓ "The stage changes. The doctrine doesn't."
    — Hemingway: six words, the whole essay compressed.

 ✓ "Presumably, some of it will be wrong. That's
    usually the interesting part."
    — Wilde: honest and quotable.
──────────────────────────────────────────────────
```

### Step 9: Apply and Summarize

Apply all approved edits to the file using the Edit tool. Apply in document order (top to bottom) to avoid offset issues. Then show the craft report:

```
╔══════════════════════════════════════════════════╗
║  CRAFT REPORT                                    ║
╠══════════════════════════════════════════════════╣
║  Applied   8/12 findings                         ║
║  Skipped   3 (user choice)                       ║
║  Noted     1 (for reiteration)                   ║
║  Words     856 → 790 (-7.7%)                     ║
╠══════════════════════════════════════════════════╣
║  Agent Contributions                             ║
║  ├─ Zinsser:   5 findings (3 applied)            ║
║  ├─ Chekhov:   3 findings (2 applied)            ║
║  ├─ Campbell:  2 findings (2 applied)            ║
║  └─ Doctrine:  2 findings (1 applied)            ║
╚══════════════════════════════════════════════════╝
```

If the user provided custom text via "Other" with notes, show them:

```
 Notes for next pass:
 • F4: "I like the structure here, but the phrasing
   needs to feel more conversational — try again"
```

### Step 10: Post-Edit Doctrine Pass (Optional)

If 5+ edits were applied, use AskUserQuestion:

```json
{
  "questions": [{
    "question": "8 edits applied. Run a quick doctrine re-check on the edited version?",
    "header": "Doctrine",
    "multiSelect": false,
    "options": [
      {"label": "Yes", "description": "Run doctrine-check on the edited file for voice violations"},
      {"label": "No", "description": "Done — I'm satisfied with the edits"}
    ]
  }]
}
```

If yes, run doctrine-check agent on the edited file. Present any new findings with the same interactive flow.

## Important Notes

- **Always use AskUserQuestion** for choices — never text-based bracket menus
- **Use preview** on AskUserQuestion options to show edits in context (the surrounding paragraph with the variant applied)
- **Never change the author's voice** — sharpen, don't replace
- **Preserve technical specificity** — RAG, MLOps, Kubernetes stay. Agents must not simplify domain terms.
- **En dashes (–)** not double hyphens (--)
- **Doctrine check has final word on voice** — if it conflicts with a literary agent, present the conflict explicitly
- **One finding at a time** — never dump all findings at once
- **The running score** (Applied/Skipped/Remaining) must update after every finding
- **"Other" replaces edit** — AskUserQuestion always provides "Other" automatically, so the user can type a custom version
