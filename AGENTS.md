# AGENTS.md

Compact guidance for OpenCode sessions on this repo. For broader conventions see `CLAUDE.md` (and `GEMINI.md`); this file holds only the non-obvious, repo-specific facts.

## What this repo is

Hugo static site (Stack theme v4 via Go modules), bilingual EN/IT, deployed to GitHub Pages at `ferdinandosantacroce.it`. The site is the deliverable; there is no application code to run.

## Commands

- `hugo server -D` — local dev server (serves drafts) at `http://localhost:1313/`
- `hugo --minify --gc` — production build (same command CI runs)
- `hugo mod get -u github.com/CaiJimmy/hugo-theme-stack/v4 && hugo mod tidy` — update theme

CI pins **Hugo extended `0.165.0`** and Go `1.27.x` (`.github/workflows/*.yml`). Build issues that only appear in CI are usually a local Hugo version mismatch — use the same extended build (`mise install hugo-extended@0.165.0`). Stack v4 note: layout overrides live in `layouts/_partials/` and `layouts/_internal/`, not `layouts/partials/`.

## Rules that are easy to violate

- **Bilingual parity is mandatory.** Every post needs both `index.en.md` and `index.it.md` — no placeholders, no English-only posts. Files without a language suffix default to English.
- **Never edit theme files directly.** The theme is a Go module, not vendored. All overrides go in `assets/css/custom.css`.
- **Deploy only via GitHub Actions.** Push to `main` triggers the deploy; do not deploy manually or commit `public/`.
- **`public/` and `resources/` are gitignored build artifacts** — never commit them.
- The `examples/` folder is intentionally NOT published (posts were moved out of `content/`); don't "fix" it by moving it back.
- A daily cron workflow auto-updates the theme and auto-commits `CI: Update theme`. Expect unexpected `go.mod`/`go.sum` changes; don't revert them unless they break the build.

## Content layout

- `content/post/<slug>/` → `index.en.md` + `index.it.md` (+ optional `cover.jpg`)
- `content/page/<name>/` → static pages (about, talks, works, ...)
- `assets/icons/` → Tabler Icons SVGs; each must have exactly `width="24" height="24" stroke-width="2" stroke="currentColor"` or it won't render in the menu.
- Permalinks: posts at `/p/:slug/`, pages at `/:slug/` (see `config/_default/permalinks.toml`).

## Linting

`.markdownlint.json` disables MD013, MD022, MD031, MD032, MD033, MD034. If you run a markdown linter, don't "fix" those — they are intentionally off.

## Front matter

```yaml
---
title: "Post Title"
date: 2024-01-15
draft: true          # remove to publish
categories: [Software]
tags: [tag1, tag2]
image: cover.jpg
---
```
