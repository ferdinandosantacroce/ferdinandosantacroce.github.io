# 🏁 Session Wrap-Up — ferdinandosantacroce.github.io

Use this skill when Nando says "wrap up", "close session", "end session", "wrap things up", or "close out this task". This ensures consistent documentation, memory updates, and deployment.

## 🧭 Workflow Overview

The wrap-up process follows 5 phases. Each phase requires conversational interaction and confirmation.

---

### Phase 1: Document It (`JOURNAL.md`)

1. **Analyze:** Review the current session's activities.
2. **Draft:** Append a new dated entry to `JOURNAL.md` at the repo root (create it if missing).
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

3. **Confirm:** Share the draft entry with Nando and ask: "Anything I missed or want to add?"
4. **Finalize:** Apply Nando's additions and write the final entry to `JOURNAL.md`.

---

### Phase 2: Commit It

1. **Status:** Run `git status` and `git diff` to review all changes.
2. **Propose:** Suggest a descriptive commit message following [Conventional Commits](https://www.conventionalcommits.org/).
3. **Safety:** NEVER commit or push automatically. Ask Nando: "Shall I commit these changes with the proposed message?"
4. **Execute:** Once approved, commit the changes.

---

### Phase 3: Remember It (Memory & Context)

Review what was learned and update the appropriate context files:

- **`GEMINI.md` / `CLAUDE.md`**: Update permanent project rules, architecture decisions, or critical commands.
- **`memory-sessions.md`**: Document the completion of substantive work.
- **`memory-decisions.md`**: Record any new architectural or content decisions.
- **`.cursor/rules/`**: Update or create rules for specific paths (e.g., `content/post/**`).

---

### Phase 4: Review & Apply (Self-Improvement)

Analyze the session for self-improvement findings. If routine, state "Nothing to improve".

**Actionable findings categories:**
- **Skill gap:** Errors or multiple attempts needed.
- **Friction:** Manual steps that should be automated.
- **Knowledge:** Project facts discovered during the session.
- **Automation:** Repetitive patterns that could become a script or skill.

**Action:** Apply these findings to `GEMINI.md` or create new skills/scripts, then summarize for Nando.

---

### Phase 5: Publish It

1. **Deploy:** Ask Nando to push to `origin main` to trigger the GitHub Pages deployment:
   ```bash
   git push origin main
   ```
2. **Verify:** Remind Nando to check the GitHub Actions run at:
   `https://github.com/ferdinandosantacroce/ferdinandosantacroce.github.io/actions`
3. **Safety:** NEVER push automatically.

---

## 🚀 Execution Strategy

When triggered, announce: "Starting the session wrap-up for ferdinandosantacroce.github.io. I'll guide you through the 5 phases."
Proceed phase by phase, waiting for Nando's input at each step.
