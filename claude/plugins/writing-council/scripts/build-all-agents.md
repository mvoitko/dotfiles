# Night Task: Build All Writing Council Agents

## Command

```bash
claude -p "$(cat <<'PROMPT'
You are building the Writing Council plugin — a multi-agent editorial review system. Your job is to implement ALL 18 unbuilt agents using deep research into each author's actual writing craft.

## Context

Read the full implementation plan first:
~/.claude/plugins/writing-council/IMPLEMENTATION-PLAN.md

Read these implemented agents as the pattern and quality bar:
- ~/.claude/plugins/writing-council/agents/feynman.md (GOLD STANDARD — match this depth)
- ~/.claude/plugins/writing-council/agents/zinsser.md
- ~/.claude/plugins/writing-council/agents/hemingway.md
- ~/.claude/plugins/writing-council/agents/chekhov.md
- ~/.claude/plugins/writing-council/agents/oscar-wilde.md
- ~/.claude/plugins/writing-council/agents/doctrine-check.md

## The 18 Agents to Build

### Tier 1 — Current Placeholders (overwrite existing files)
1. campbell — Hero's journey, story arc ("The Hero with a Thousand Faces", "The Power of Myth")
2. gladwell — Hooks, narrative non-fiction ("Outliers", "The Tipping Point", New Yorker articles)
3. paul-graham — Essay clarity, thesis-first ("How to Write Usefully", "Write Like You Talk", "Putting Ideas Into Words")
4. cialdini — Persuasion principles ("Influence", "Pre-Suasion")
5. horowitz — Business writing, hard truths ("The Hard Thing About Hard Things", a16z blog)
6. bradbury — Poetic precision, sensory writing ("Zen in the Art of Writing", "Fahrenheit 451")
7. thiel — Contrarian framing, zero-to-one ("Zero to One", Stanford lectures)
8. orwell — Anti-bullshit, political language ("Politics and the English Language", "Why I Write")

### Tier 2 — From M's Favorites (create new files)
9. robert-greene — Strategic framing ("48 Laws of Power", "Mastery", "The Laws of Human Nature")
10. dovlatov — Radical economy, humor through understatement ("The Suitcase", "The Zone", prose rules)
11. brodsky — Intellectual density, metaphor as argument ("Less Than One", "On Grief and Reason", Nobel lecture)
12. pelevin — Postmodern wit, social satire, ironic distance ("Generation P", "Omon Ra")
13. asimov — Encyclopedic clarity, accessible complexity ("I, Asimov", science essays)
14. tolkien — Internal consistency, sub-creation theory ("On Fairy-Stories", Letters)
15. george-martin — Stakes and consequences, subverting expectations (interviews, "Not a Blog")
16. zelazny — Mythic compression, first-person authority ("Lord of Light", "Amber" series)
17. strugatsky — Ambiguous commentary, systemic critique ("Roadside Picnic", "Hard to Be a God")

### Tier 3 — Craft Masters (create new files)
18. taleb — Antifragile thinking, skin in the game, via negativa ("Antifragile", "Skin in the Game")
19. vonnegut — Dark simplicity, 8 rules for writing ("Bagombo Snuff Box" rules, "Slaughterhouse-Five")
20. ogilvy — Advertising craft, headlines, benefits over features ("Ogilvy on Advertising")
21. hitchens — Polemic force, argumentative precision ("Letters to a Young Contrarian", debates)
22. didion — Personal essay, observation as argument ("Slouching Towards Bethlehem", "Why I Write")
23. mckee — Story structure, turning points, scene design ("Story")
24. pressfield — Resistance, professional vs amateur ("The War of Art", "Nobody Wants to Read Your Sh*t")

## Implementation Instructions

Launch ALL 18 agents IN PARALLEL. Each agent subagent must:

1. Do DEEP web research — use WebSearch and WebFetch to find the author's actual works, essays, interviews, and lectures. Find REAL quotes. Read PRIMARY sources.

2. Extract 5-8 editorial principles, each with:
   - A principle name
   - A real quote or explanation from the author's actual work
   - "Check for:" bullet list of specific editorial actions

3. Write the agent file to ~/.claude/plugins/writing-council/agents/{name}.md following this EXACT structure (from feynman.md):
   ```
   ---
   name: {name}
   description: "{one-line editorial role description}"
   ---

   # {Name} – {Role} Editor

   You are an editor applying {name}'s principles...

   ## Principles to Apply

   ### 1. {Principle Name}
   {Quote or explanation from actual source}
   **Check for:**
   - {specific editorial check}
   - {specific editorial check}

   [5-8 principles total]

   ## Output Format
   Return findings grouped as CRITICAL / IMPROVE / POLISH / STRENGTHS...

   ## Important
   - {guardrails}
   ```

4. QUALITY REQUIREMENTS:
   - Every principle MUST trace to a real quote, book, essay, or lecture
   - "Check for:" lists must be specific and actionable
   - Each agent is an EDITOR applying principles, NOT an imitator of voice
   - Must include guardrails: preserve technical specificity, respect author's voice
   - Match the depth of feynman.md (the gold standard)
   - No placeholder text, no generic advice

## After All Agents Complete

1. Verify all 18 files exist with proper content:
   ```bash
   for f in campbell gladwell paul-graham cialdini horowitz bradbury thiel orwell robert-greene dovlatov brodsky pelevin asimov tolkien george-martin zelazny strugatsky taleb vonnegut ogilvy hitchens didion mckee pressfield; do
     echo "=== $f ==="
     wc -l ~/.claude/plugins/writing-council/agents/$f.md
   done
   ```

2. Check no placeholder text remains:
   ```bash
   grep -l "Placeholder\|TBD\|to be implemented" ~/.claude/plugins/writing-council/agents/*.md
   ```

3. Update the panel taxonomy in ~/.claude/plugins/writing-council/config/panels.md to add the new panel configurations from the implementation plan (Ukrainian, strategy, deep-tech, polemic, memoir, satire, long-narrative, career panels).

4. Test 3-4 agents against the blog post to verify useful output:
   ~/.claude/plugins/writing-council/agents/{pick 3-4 from different tiers}
   Blog post: ~/Documents/projects/mvoitko.github.io/src/content/blog/2026-03-19-why-im-joining-monday.md

PROMPT
)" --allowedTools "Agent,Read,Write,Edit,Glob,Grep,WebSearch,WebFetch,Bash(ls*),Bash(wc*),Bash(grep*),Bash(for*),Bash(echo*),Bash(cat*)" --verbose 2>&1 | tee ~/.claude/plugins/writing-council/build-log.txt
```

## Expected Duration

~30-60 minutes. 18 parallel web research agents is heavy.

## Verification After

```bash
# Quick check — all files should be 3-10KB (placeholders were ~350B)
ls -lS ~/.claude/plugins/writing-council/agents/*.md

# No placeholders left
grep -l "Placeholder\|to be implemented" ~/.claude/plugins/writing-council/agents/*.md

# Count principles per agent (should be 5-8 each)
for f in ~/.claude/plugins/writing-council/agents/*.md; do
  name=$(basename "$f" .md)
  count=$(grep -c "^### [0-9]" "$f")
  echo "$name: $count principles"
done

# Spot-check quality — read a random Tier 2 agent
cat ~/.claude/plugins/writing-council/agents/dovlatov.md
```
