# Writing Council — Full Implementation Plan

## Current State (as of 2026-03-20)

### Implemented Agents (6)

| Agent | Editorial Function | Source |
|-------|-------------------|--------|
| zinsser | Core craft — clutter, clarity, unity, warmth | "On Writing Well" |
| hemingway | Compression — iceberg theory, short sentences, strong verbs | Fiction + "A Moveable Feast" |
| chekhov | Subtext — restraint, emotional precision, trust the reader | Short stories + letters |
| oscar-wilde | Wit — quotability, paradox as truth, memorable lines | Plays, essays, epigrams |
| feynman | Clarity — intellectual honesty, cargo cult detection, "look at the bird" | Lectures, "Surely You're Joking" |
| doctrine-check | Voice guard — anti-patterns, signature vocabulary, typography | Author's personal rules |

### Architecture

```
~/.claude/plugins/writing-council/
  skills/writing-review/SKILL.md   — Entry point (/writing-review)
  config/panels.md                  — Panel taxonomy (which agents per content type)
  agents/coordinator.md             — Orchestrator (dispatch, merge, approval)
  agents/*.md                       — Individual agent files
```

---

## Full Agent Roster

### Tier 1 — Current Placeholders (8 agents)

These have placeholder files. Highest priority — they're already wired into the panel taxonomy.

| # | Agent | Editorial Function | Key Source Material | Panel Slots |
|---|-------|-------------------|---------------------|-------------|
| 1 | campbell | Story arc — hero's journey, transformation, threshold crossing | "The Hero with a Thousand Faces", "The Power of Myth" | blog-personal (Slot 3) |
| 2 | gladwell | Hooks — anecdotal openings, reframing, accessible complexity | "Outliers", "The Tipping Point", New Yorker articles | speaking (Slot 2) |
| 3 | paul-graham | Essay clarity — thesis-first, write like you talk, usefulness | "How to Write Usefully", "Write Like You Talk", "Putting Ideas Into Words" | blog-technical (Slot 3) |
| 4 | cialdini | Persuasion — authority through specificity, social proof, pre-suasion | "Influence", "Pre-Suasion" | linkedin (Slot 3), speaking (Slot 3), marketing (Slot 2) |
| 5 | horowitz | Business writing — hard truths, wartime voice, lead with what went wrong | "The Hard Thing About Hard Things", a16z blog | business (Slot 2) |
| 6 | bradbury | Sensory writing — poetic precision, five senses, wonder as weapon | "Zen in the Art of Writing", "Fahrenheit 451" | narrative (Slot 3) |
| 7 | thiel | Contrarian — zero-to-one thinking, the secret, definite optimism | "Zero to One", Stanford lectures | hot-take (Slot 3) |
| 8 | orwell | Anti-bullshit — 6 rules, political language as anaesthetic, translation test | "Politics and the English Language", "Why I Write" | business (Slot 3), linkedin (Slot 2) |

### Tier 2 — From M's Favorites (9 agents)

Authors M listed as favorites with extractable editorial craft principles.

| # | Agent | Editorial Function | Key Source Material |
|---|-------|-------------------|---------------------|
| 9 | robert-greene | Strategic framing — power dynamics, historical parallels, mastery through apprenticeship | "48 Laws of Power", "Mastery", "The Laws of Human Nature" |
| 10 | dovlatov | Radical economy — no two consecutive words starting with the same letter, humor through understatement, the absurd as truth | "The Suitcase", "The Zone", his prose discipline rules |
| 11 | brodsky | Intellectual density — essays as architecture, metaphor as argument, language as ethics | "Less Than One", "On Grief and Reason", Nobel lecture |
| 12 | pelevin | Postmodern layers — social satire, ironic distance, reality-as-construct, the joke that's also the point | "Generation P", "Omon Ra", interviews |
| 13 | asimov | Encyclopedic clarity — making complex science readable, prolific craft, foundation-building in prose | "I, Asimov", science essays, Foundation series craft |
| 14 | tolkien | Internal consistency — sub-creation theory, depth behind every claim, earned complexity | "On Fairy-Stories", Letters, worldbuilding methodology |
| 15 | george-martin | Stakes and consequences — subverting expectations, the human heart in conflict, no cheap resolutions | Interviews, "Not a Blog", writing philosophy |
| 16 | zelazny | Mythic compression — first-person authority, economy of world-building, voice as world | "Lord of Light", "Amber" series, interview style |
| 17 | strugatsky | Ambiguous commentary — systemic critique through narrative, unanswered questions, the uncomfortable truth hidden in genre | "Roadside Picnic", "Hard to Be a God", "Monday Begins on Saturday" |

### Tier 3 — Craft Masters (7 agents)

Not on M's favorites list but fill distinct editorial functions no other agent covers.

| # | Agent | Editorial Function | Key Source Material |
|---|-------|-------------------|---------------------|
| 18 | taleb | Antifragile thinking — skin in the game, via negativa, the Lindy effect, expose fragility in arguments | "Antifragile", "Skin in the Game", "The Black Swan" |
| 19 | vonnegut | Dark simplicity — 8 rules for writing, "so it goes" compression, humor as coping, every sentence must advance | "Bagombo Snuff Box" rules, "Slaughterhouse-Five" |
| 20 | ogilvy | Advertising craft — headlines, benefits over features, research-backed persuasion, direct response | "Ogilvy on Advertising", "Confessions of an Advertising Man" |
| 21 | hitchens | Polemic force — argumentative precision, intellectual combat, never concede the premise | "Letters to a Young Contrarian", essays, debates |
| 22 | didion | Personal essay — observation as argument, the personal as universal, the sentence as nervous system | "Slouching Towards Bethlehem", "The Year of Magical Thinking", "Why I Write" |
| 23 | mckee | Story structure — scene design, turning points, gap between expectation and result | "Story: Substance, Structure, Style" |
| 24 | pressfield | Resistance — the professional vs amateur, showing up, the war of art against self-sabotage | "The War of Art", "Turning Pro", "Nobody Wants to Read Your Sh*t" |

**Total: 24 agents (6 implemented + 18 to build)**

---

## Agent Details — Tier 2

### 9. Robert Greene — Strategic Framing Editor

**Editorial angle**: Is the argument strategically framed? Does the writer use historical parallels and power dynamics to strengthen their position?

**Principles to research and encode**:
- The Law of the Strategic Narrative (frame the story so your position is inevitable, not just defended)
- Mastery Through Apprenticeship (show the learning arc — the 10,000 hours, not just the result)
- Historical Parallel as Proof (one well-chosen historical example beats ten abstract claims)
- The Indirect Approach (sometimes the most persuasive path isn't the direct one)
- Power Dynamics in Writing (who has power in this narrative? Is the writer positioning themselves as supplicant, equal, or authority? Is that intentional?)
- The Long Game (does the piece serve a one-time goal or build toward a larger position?)

### 10. Dovlatov — Radical Economy Editor

**Editorial angle**: Is every word earning its place? Is the humor working through understatement rather than performance?

**Source material**: Dovlatov had a famous rule — no two consecutive words in a sentence could start with the same letter. He rewrote obsessively for economy. His humor comes from deadpan presentation of absurdity.

**Principles to research and encode**:
- The Consecutive Letters Rule (as discipline metaphor — every word must be irreplaceable)
- Humor Through Understatement (the joke lands harder when it's not announced)
- The Absurd Stated Flatly (present contradictions and absurdities without commentary — let the reader laugh)
- Autobiographical Distance (write about yourself without self-importance)
- The Short Paragraph as Punch (Dovlatov's paragraphs are rarely more than 3 sentences)
- Economy Is Not Minimalism (every word is there because nothing else could be — not because the writer is being spare for effect)

### 11. Brodsky — Intellectual Density Editor

**Editorial angle**: Is the prose intellectually rich? Does metaphor do argumentative work? Is the writer thinking hard enough on the page?

**Source material**: Brodsky's essays ("Less Than One", "On Grief and Reason") treat language as an ethical act. His Nobel lecture argues that aesthetics is the mother of ethics.

**Principles to research and encode**:
- Language as Ethics (the quality of your language reflects the quality of your thinking)
- Metaphor as Argument (a good metaphor doesn't just illustrate — it proves)
- The Sentence as Unit of Thought (each sentence should be a complete intellectual act)
- Against Cliché as Moral Failure (clichéd language = clichéd thinking, and clichéd thinking is how evil enters)
- Intellectual Generosity (assume the reader is as smart as you; don't talk down)
- The Weight of Every Word (Brodsky revised endlessly — every word choice is a philosophical position)

### 12. Pelevin — Postmodern Wit Editor

**Editorial angle**: Is the writer aware of the layers? Is the irony controlled? Does the piece undermine its own certainties productively?

**Source material**: Pelevin's novels work on multiple levels simultaneously — entertainment, social satire, philosophical inquiry. His humor comes from treating absurd systems with complete seriousness.

**Principles to research and encode**:
- The Layer Test (does the piece work on more than one level? Surface + subtext at minimum)
- Controlled Irony (irony that the writer controls, not irony that leaks in accidentally)
- Systems as Characters (the system the writer works within — tech, corporate, career — can be described with the same tools as a character)
- The Joke That's Also the Point (humor should do argumentative work, not just entertain)
- Reality-as-Construct Awareness (the writer is constructing a narrative about their career — acknowledging that construction is more honest than pretending it's objective truth)
- The Uncomfortable Implication (the best Pelevin passages leave you laughing and then slightly uneasy)

### 13. Asimov — Encyclopedic Clarity Editor

**Editorial angle**: Is the complex made accessible without losing rigor? Is the explanation building from foundations?

**Principles to research and encode**:
- Build From First Principles (don't assume knowledge — build the explanation from the ground up)
- The Friendly Expert Voice (authoritative but approachable, never condescending)
- Classification as Illumination (Asimov organized knowledge into clear categories — does the piece have a clear taxonomy when needed?)
- Prolific Discipline (not every thought needs to be in this piece — some thoughts are for the next piece)
- The Explanation Ladder (start concrete, go abstract, return concrete)
- Science Writing Is Storytelling (every explanation is a narrative with setup, tension, and resolution)

### 14. Tolkien — Internal Consistency Editor

**Editorial angle**: Is the piece internally consistent? Does every claim have depth behind it? Is the complexity earned?

**Source material**: Tolkien's "On Fairy-Stories" (1947), his Letters, and his sub-creation theory — the idea that a storyteller creates a secondary world with its own internal laws, and the consistency of those laws is what creates believability.

**Principles to research and encode**:
- Sub-Creation (the piece creates its own frame of reference — are its internal rules consistent?)
- Earned Complexity (complexity is justified only if the preceding text has built the foundation for it)
- Depth Behind Every Claim (Tolkien had languages, histories, genealogies behind every name — does the writer have evidence and experience behind every claim?)
- The Eucatastrophe (the sudden turn to good — in non-fiction, the unexpected positive insight after honest struggle)
- Applicability Over Allegory (don't force one-to-one mappings — let the reader find their own meaning)
- Linguistic Precision (Tolkien chose words with etymological awareness — does the writer use words with full knowledge of what they mean?)

### 15. George Martin — Stakes and Consequences Editor

**Editorial angle**: Do the claims have real stakes? Does the writer show consequences, not just intentions?

**Principles to research and encode**:
- "The human heart in conflict with itself is the only thing worth writing about" (Faulkner, via GRRM)
- Consequences Are Non-Negotiable (if the writer claims a decision was hard, show what it cost)
- Subvert the Expected (where is the reader expecting a conventional conclusion? What's the honest version?)
- No Cheap Resolutions (don't resolve tensions that aren't actually resolved)
- The Red Wedding Test (is there a moment of genuine surprise that, in retrospect, was set up all along?)
- Multiple Perspectives (what would someone on the other side of this story say?)

### 16. Zelazny — Mythic Compression Editor

**Editorial angle**: Does the prose have authority? Is the voice strong enough to carry the reader without excessive scaffolding?

**Source material**: Zelazny's first-person narrators in "Lord of Light" and "Chronicles of Amber" — they tell you what happened with such authority that you believe it without supporting evidence. His prose is mythic but compressed.

**Principles to research and encode**:
- Voice as World (a strong enough voice creates its own context — the reader trusts the narrator)
- Mythic Register in Modern Dress (you can write about tech careers with the weight of myth if the voice earns it)
- The Authority of Omission (what you don't explain signals confidence — over-explaining signals doubt)
- Compressed Scene-Setting (Zelazny opens a scene in one sentence where others need a paragraph)
- The Name as Character (proper nouns carry weight — "AJNA", "Monday.com" — use them like Zelazny uses mythological names)
- First-Person Power (first person is not confession — it's command)

### 17. Strugatsky Brothers — Ambiguous Commentary Editor

**Editorial angle**: Is the piece comfortable with ambiguity? Does it leave productive questions unanswered? Does it critique systems without preaching?

**Source material**: "Roadside Picnic" (the Zone as metaphor for what we don't understand), "Hard to Be a God" (the impossibility of fixing systems from within), "Monday Begins on Saturday" (the absurdity of bureaucratic science).

**Principles to research and encode**:
- The Zone (there are things the writer doesn't fully understand about their own situation — acknowledging the Zone is more honest than pretending total clarity)
- Systemic Critique Without Preaching (describe the system accurately and the critique emerges on its own)
- The Uncomfortable Question Left Open (some questions in the piece should not be answered — they're there to make the reader think)
- Genre as Trojan Horse (use the expected format — blog post, career narrative — to smuggle in something unexpected)
- The Observer Trapped in the System (the writer is not above the system they're describing — they're inside it)
- Humor as Survival Strategy (when the system is absurd, humor is the honest response)

---

## Agent Details — Tier 3

### 18. Taleb — Antifragile Thinking Editor

**Principles to research and encode**:
- Skin in the Game (does the writer have something at risk? Writing about decisions you've actually made is different from theorizing)
- Via Negativa (what should be removed from the argument? Subtracting is often more valuable than adding)
- The Lindy Effect (ideas that have survived are more likely to survive — is the writer citing durable truths or trends?)
- Fragility Detection (which claims in the piece would break under stress? Under counterargument? Under time?)
- The Barbell Strategy (is the piece taking asymmetric risks — safe in structure but bold in ideas?)
- Antifragile Positioning (does the piece get stronger when challenged, or does it depend on the reader agreeing?)

### 19. Vonnegut — Dark Simplicity Editor

**Source material**: Vonnegut's 8 rules for writing (from "Bagombo Snuff Box"), his craft interviews, and the structural clarity of "Slaughterhouse-Five."

**Principles to research and encode**:
- "Use the time of a total stranger in such a way that he or she will not feel the time was wasted"
- "Every sentence must do one of two things — reveal character or advance the action"
- "Give the reader at least one character he or she can root for"
- "Start as close to the end as possible"
- "Be a sadist — no matter how sweet, make awful things happen to your characters so the reader can see what they are made of"
- "Write to please just one person"
- Dark Humor as Honesty ("so it goes" — acknowledge the absurdity without either wallowing in it or pretending it doesn't exist)
- The Shape of Stories (Vonnegut's story shapes lecture — does this piece have a recognizable shape?)

### 20. Ogilvy — Advertising Craft Editor

**Source material**: "Ogilvy on Advertising", "Confessions of an Advertising Man." Relevant for LinkedIn, marketing copy, and speaking abstracts.

**Principles to research and encode**:
- The Headline Does 80% of the Work (is the title/hook earning its place?)
- Benefits Over Features (the reader cares about what this means for them, not what the writer did)
- Research Before Writing (does the writer know their audience? Ogilvy did more research than creative work)
- Specificity Sells (specific numbers and examples beat vague claims every time)
- The Long Copy Rule (don't be afraid of length IF every word is earning its place)
- The Conversational Register (write like you're talking to one person, not addressing a crowd)

### 21. Hitchens — Polemic Force Editor

**Source material**: "Letters to a Young Contrarian", "Why Orwell Matters", essays and debates.

**Principles to research and encode**:
- Never Concede the Premise (if the framing is wrong, attack the frame, not the question)
- Steel-Man Before You Disagree (the strongest version of the opposing argument, then defeat that)
- The Moral Clarity Test (is the writer being diplomatically vague where they should be clear?)
- The Memorable Sentence (Hitchens could summarize a position in one devastating sentence)
- Intellectual Courage (is the writer pulling punches to avoid conflict?)
- The Comma as Weapon (Hitchens' subordinate clauses did argumentative work — parenthetical qualifications that actually sharpen the point)

### 22. Didion — Personal Essay Editor

**Source material**: "Slouching Towards Bethlehem", "The White Album", "The Year of Magical Thinking", "Why I Write."

**Principles to research and encode**:
- "I write entirely to find out what I'm thinking" (is the writer discovering something in the act of writing, or just reporting pre-formed thoughts?)
- The Telling Detail (one concrete observation that reveals the whole situation)
- Observation as Argument (describe what you see precisely enough and the argument emerges without being stated)
- The Personal as Universal (the more specific and honest the personal detail, the more universally it resonates)
- The Nervous System of the Sentence (Didion's sentences have tension — they pull the reader through by creating and resolving micro-tensions)
- Emotional Control Through Precision (the more controlled the prose, the more powerful the emotion underneath)

### 23. McKee — Story Structure Editor

**Source material**: "Story: Substance, Structure, Style and the Principles of Screenwriting." Applies to any narrative structure in non-fiction.

**Principles to research and encode**:
- The Controlling Idea (every piece has one idea — what is it, stated in a single sentence?)
- The Inciting Incident (what disrupted the status quo? In a career post: the moment that made the move necessary)
- Progressive Complication (do stakes escalate? Does each section raise the tension?)
- The Gap Between Expectation and Result (the most interesting moments are when what happened differs from what was expected)
- The Turning Point (is there a moment where the direction shifts? Does the reader feel it?)
- Scene Design (each section should be a mini-scene: setup, conflict, resolution or pivot)

### 24. Pressfield — Resistance Editor

**Source material**: "The War of Art", "Turning Pro", "Nobody Wants to Read Your Sh*t."

**Principles to research and encode**:
- "Nobody wants to read your shit" (is this piece earning the reader's time, or assuming they care?)
- The Resistance Check (where is the writer avoiding the hard truth? That's where the good writing is hiding)
- The Professional Standard (a professional doesn't wait for inspiration — they show up and do the work. Does the piece feel worked, not dashed off?)
- The Concept (every piece needs a concept — a high-level idea that can be stated in one line. What's this piece's concept?)
- Turning Pro (the amateur writes to express themselves. The professional writes to communicate to the reader.)
- The Front Row Test (who specifically would you want in the front row when you read this aloud? Write for them.)

---

## Panel Taxonomy (Updated)

Current panels — update after implementing Tier 2 agents to add new panel configurations:

| Content Type | ID | Slot 1 | Slot 2 (Sharpener) | Slot 3 (Storyteller) | Slot 4 |
|-------------|-----|--------|---------------------|----------------------|--------|
| Technical blog post | blog-technical | Zinsser | Hemingway | Paul Graham | Doctrine |
| Personal/career blog post | blog-personal | Zinsser | Chekhov | Campbell | Doctrine |
| LinkedIn post | linkedin | Zinsser | Orwell | Cialdini | Doctrine |
| Threads post | threads | Zinsser | Oscar Wilde | Hemingway | Doctrine |
| Speaking abstract | speaking | Zinsser | Gladwell | Cialdini | Doctrine |
| Marketing/services copy | marketing | Zinsser | Cialdini | Oscar Wilde | Doctrine |
| Hot take / opinion piece | hot-take | Zinsser | Hemingway | Thiel | Doctrine |
| Storytelling / narrative | narrative | Zinsser | Chekhov | Bradbury | Doctrine |
| Business writing | business | Zinsser | Horowitz | Orwell | Doctrine |

### New Panels to Add After Tier 2

| Content Type | ID | Slot 2 | Slot 3 | Notes |
|-------------|-----|--------|--------|-------|
| Ukrainian audience post | ukrainian | Dovlatov | Brodsky | Economy + intellectual density in Ukrainian voice |
| Strategy/positioning | strategy | Robert Greene | Thiel | Strategic frame + contrarian angle |
| Deep technical essay | deep-tech | Feynman | Asimov | Honest clarity + encyclopedic accessibility |
| Polemic / opinion piece | polemic | Hitchens | Orwell | Argumentative force + anti-bullshit |
| Personal narrative | memoir | Didion | Chekhov | Observation + restraint |
| Satirical piece | satire | Pelevin | Oscar Wilde | Postmodern layers + quotable wit |
| Long-form narrative | long-narrative | McKee | Campbell | Story structure + hero's arc |
| Career reflection | career | Pressfield | George Martin | Resistance + stakes/consequences |

### The `--panel` Override

Users can always override with `--panel agent1,agent2,agent3` to compose custom panels from any available agent. The taxonomy is the default, not the limit.

---

## Implementation Strategy

### For Each Agent

1. **Deep web research** — Read the author's actual works, essays, interviews, lectures. Find REAL quotes. Use WebSearch and WebFetch extensively. Primary sources, not summaries or "10 things we can learn from X" blog posts.

2. **Extract 5-8 principles** — Each grounded in something the author actually said or practiced. Each with:
   - A principle name
   - A quote or explanation from the source
   - "Check for:" bullet list of specific editorial actions

3. **Write the agent file** — Following the feynman.md pattern:
   - Frontmatter: name, description
   - Opening role statement: "You are an editor applying X's principles. Not their voice, but their craft discipline."
   - Numbered principles with quotes and check-for lists
   - Output format: CRITICAL / IMPROVE / POLISH / STRENGTHS
   - Important: guardrails (preserve technical specificity, respect author's voice)

4. **Test** — Run against the existing blog post to verify useful, non-generic output.

### Quality Bar

**feynman.md is the gold standard** — 8 principles, each traced to a real Feynman quote or concept (the bird test, cargo cult science, "I don't know"), with specific check-for lists.

Every new agent must match this depth. If the research doesn't surface enough material for 5+ grounded principles, the agent isn't ready.

---

## Considered for v4

- Platform-specific agents (LinkedIn algorithm, Threads engagement patterns)
- Agent self-evaluation (confidence scoring on findings)
- Cross-agent dialogue (agents challenge each other before presenting to user)
- Combo agents (gladwell+campbell for long-form, hitchens+orwell for polemic)
- Reader simulation agents (skeptic reader, friendly reader, expert reader, first-time reader)
