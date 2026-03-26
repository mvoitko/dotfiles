# Panel Taxonomy

Default panel configurations by content type. Zinsser and Doctrine check always run. The remaining 2 slots are filled from the taxonomy below.

## Panel Configurations

| Content Type | ID | Slot 2 (Sharpener) | Slot 3 (Storyteller/Context) |
|-------------|-----|--------------------|-----------------------------|
| Technical blog post | `blog-technical` | Hemingway | Paul Graham |
| Personal/career blog post | `blog-personal` | Chekhov | Campbell |
| LinkedIn post | `linkedin` | Orwell | Cialdini |
| Threads post | `threads` | Oscar Wilde | Hemingway |
| Speaking abstract | `speaking` | Gladwell | Cialdini |
| Marketing/services copy | `marketing` | Cialdini | Oscar Wilde |
| Hot take / opinion piece | `hot-take` | Hemingway | Thiel |
| Storytelling / narrative | `narrative` | Chekhov | Bradbury |
| Business writing | `business` | Horowitz | Orwell |
| Ukrainian audience post | `ukrainian` | Dovlatov | Brodsky |
| Strategy / positioning | `strategy` | Robert Greene | Thiel |
| Deep technical essay | `deep-tech` | Feynman | Asimov |
| Polemic / opinion piece | `polemic` | Hitchens | Orwell |
| Personal narrative | `memoir` | Didion | Chekhov |
| Satirical piece | `satire` | Pelevin | Oscar Wilde |
| Long-form narrative | `long-narrative` | McKee | Campbell |
| Career reflection | `career` | Pressfield | George Martin |

## Platform Character Limits

When reviewing content, enforce the platform's character limit. Flag drafts that exceed it and help trim to fit.

| Platform | Limit |
|----------|-------|
| Threads | 500 chars |
| LinkedIn | 3,000 chars |

## Agent Roles

Each slot serves a function:

- **Slot 1 (always Zinsser)**: Core craft — clutter, clarity, unity, warmth
- **Slot 2 (Sharpener)**: Tightens prose, cuts fat, improves rhythm
- **Slot 3 (Storyteller/Context)**: Adds arc, hook, persuasion, or structural insight
- **Slot 4 (always Doctrine)**: Voice guard — ensures output matches the author's personal doctrine and style rules

## Available Agents

### Core (always active)
- `zinsser` — Core craft (On Writing Well)
- `doctrine-check` — Personal voice/doctrine guard

### Implemented — Tier 0 (v1)
- `hemingway` — Compression, punch, iceberg theory
- `chekhov` — Subtext, restraint, emotional precision
- `oscar-wilde` — Wit, quotability, memorable lines
- `feynman` — Clarity, intellectual honesty, concrete over abstract, cargo cult detection

### Implemented — Tier 1 (v2)
- `campbell` — Hero's journey, story arc, transformation
- `gladwell` — Hooks, narrative non-fiction, accessible complexity
- `paul-graham` — Essay clarity, thesis-first, usefulness test
- `cialdini` — Persuasion principles, authority, social proof, pre-suasion
- `horowitz` — Business writing, hard truths, earn your optimism
- `bradbury` — Sensory writing, poetic precision, wonder
- `thiel` — Contrarian framing, zero-to-one thinking, definite optimism
- `orwell` — Anti-bullshit, six rules, the insincerity test

### Implemented — Tier 2 (v2)
- `robert-greene` — Strategic framing, power dynamics, mastery through apprenticeship
- `dovlatov` — Radical economy, consecutive letters rule, humor through understatement
- `brodsky` — Intellectual density, metaphor as argument, aesthetics as ethics
- `pelevin` — Postmodern wit, layer test, controlled irony, systems as characters
- `asimov` — Encyclopedic clarity, explanation ladder, friendly expert voice
- `tolkien` — Internal consistency, sub-creation, earned complexity, depth behind claims
- `george-martin` — Stakes and consequences, human heart in conflict, no cheap resolutions
- `zelazny` — Mythic compression, voice as world, authority of omission
- `strugatsky` — Ambiguous commentary, systemic critique, productive uncertainty

### Implemented — Tier 3 (v2)
- `taleb` — Antifragile thinking, skin in the game, via negativa, Lindy effect
- `vonnegut` — Dark simplicity, 8 rules, shape of stories, "so it goes"
- `ogilvy` — Advertising craft, headlines, benefits over features, specificity sells
- `hitchens` — Polemic force, never concede the premise, steel-man, moral clarity
- `didion` — Personal essay, writing as discovery, telling detail, observation as argument
- `mckee` — Story structure, controlling idea, scene turns, the gap
- `pressfield` — Resistance detection, nobody wants to read your shit, turning pro

### The `--panel` Override

Users can always override with `--panel agent1,agent2,agent3` to compose custom panels from any available agent. The taxonomy is the default, not the limit.
