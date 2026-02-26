---
name: wrap-up
description: Use when user says "wrap up", "close session", "end session",
  "wrap things up", "close out this task", or invokes /wrap-up — runs
  end-of-session checklist for this blog: journal, commit, memory, deploy
---

# Session Wrap-Up — ferdinandosantacroce.github.io

Run four phases in order. All phases are conversational and inline.
Each phase requires user confirmation; present a consolidated report at the end.

## Phase 1: Document It (JOURNAL.md)

1. Append a new dated entry to `JOURNAL.md` at the repo root (create it if missing).
   Entry format:

   ```markdown
   ## YYYY-MM-DD

   ### Posts worked on
   - `content/post/<slug>/` — title, language(s), status (draft/published/translated)

   ### Hugo/theme/config changes
   - List any template, config, asset, or theme changes

   ### Content decisions
   - Tagging choices, structure decisions, bilingual strategy notes

   ### Open items for next session
   - Unfinished work, pending translations, ideas to explore
   ```

2. Share the draft entry with Nando.
3. Ask: "Anything I missed or want to add?"
4. Apply Nando's additions, write the final entry to `JOURNAL.md`.
5. Proceed to Phase 2.

## Phase 2: Commit It

1. Run `git status` to check changes made during the session.
2. If uncommitted changes exist, suggest a descriptive commit message following conventional commits.
3. NEVER push automatically — always ask.
4. Proceed to Phase 3.

## Phase 3: Remember It

Review what was learned. Decide where each piece belongs:

**Memory placement guide:**
- **Auto memory** (`.claude/projects/.../memory/`) — Blog-specific patterns
  Claude discovered: front matter conventions, tag taxonomy preferences,
  bilingual workflow quirks, image handling, Hugo version gotchas
- **CLAUDE.md** (this repo) — Permanent project rules, architecture decisions,
  commands that should guide all future sessions
- **`.claude/rules/`** — Topic-scoped rules (e.g. rules for `content/post/**`,
  rules for `assets/**`)
- **`CLAUDE.local.md`** — Personal WIP context, local draft notes, things
  not to commit

**Decision framework:**
- Permanent blog convention or architecture? → `CLAUDE.md`
- Pattern Claude discovered (tag style, image resize, bilingual naming)? → Auto memory
- Scoped to specific content or asset files? → `.claude/rules/` with `paths:`
- Personal / ephemeral context? → `CLAUDE.local.md`

Note anything important in the appropriate location.

## Phase 4: Review & Apply

Analyze the session for self-improvement findings. If it was short or routine
with nothing notable, say "Nothing to improve" and proceed to Phase 5.

**Auto-apply all actionable findings immediately** — do not ask for approval
on each one. Apply, then present a summary.

**Finding categories:**
- **Skill gap** — Things Claude got wrong or needed multiple attempts
- **Friction** — Manual steps Nando had to ask for that should be automatic
- **Knowledge** — Blog/Hugo facts Claude didn't know but should have
- **Automation** — Repetitive patterns that could become a skill, hook, or script

**Action types:**
- `CLAUDE.md` — Edit the project CLAUDE.md
- `Rules` — Create/update a `.claude/rules/` file
- `Auto memory` — Save an insight for future sessions
- `Skill / Hook` — Document a new skill or hook spec

Present a summary after applying:

```
Findings (applied):
1. ✅ Knowledge: Italian posts need `translationKey` to link across languages
   → [CLAUDE.md] Added bilingual linking note

No action needed:
2. Knowledge: Tag taxonomy already documented in CLAUDE.md
```

## Phase 5: Publish It

1. Ask Nando to push to `origin main` to trigger the GitHub Pages deploy:
   ```bash
   git push origin main
   ```
2. Remind Nando to check the Actions run at:
   `https://github.com/ferdinandosantacroce/ferdinandosantacroce.github.io/actions`
3. NEVER push automatically — always ask first.
