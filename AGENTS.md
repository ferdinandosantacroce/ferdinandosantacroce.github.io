# AGENTS.md

Compact guidance for OpenCode sessions on this repo. Only the non-obvious, repo-specific facts.

## What this repo is

Hugo static site (Stack theme v4 via Go modules), bilingual EN/IT, deployed to GitHub Pages at `ferdinandosantacroce.it`. The site is the deliverable: there is no application code to run. It is both a blog and, over time, Nando's professional hub for career, projects and services.

**State at 2026-10-20:** one published article, 30 talks, 8 works, 4 static pages, 2 resource pages. Thirteen MokaByte articles sit in `raw/` waiting to be republished. The plan and its progress live in `docs/piano-evoluzione-blog.md`; read it before starting content work.

## Commands

- `mise install` — installs Hugo extended `0.165.0`
- `hugo server -D` — dev server with drafts at `http://localhost:1313/`
- `hugo --minify --gc` — production build, the same command CI runs
- `hugo mod get -u github.com/CaiJimmy/hugo-theme-stack/v4 && hugo mod tidy` — update the theme
- `mise x actionlint@latest -- actionlint .github/workflows/*.yml` — validate workflows after editing them

CI pins **Hugo extended `0.165.0`** and Go `1.27.x` (`.github/workflows/*.yml`). Build issues that only appear in CI are usually a local Hugo version mismatch. Stack v4 note: layout overrides live in `layouts/_partials/` and `layouts/_internal/`, not `layouts/partials/`. `hugo mod tidy` does not remove the `// indirect` marker from `go.mod`; remove it by hand when the theme is a direct dependency.

## Rules that are easy to violate

- **Publication is on hold.** Nando wants the site fixed before it goes live. Every commit message ends with `[ci skip]`, so pushes never deploy. Publish only on explicit request, with a dedicated empty commit without the marker: `git commit --allow-empty -m "chore: publish"`. The marker must be in the head commit of the push.
- **Strict bilingual parity.** Every bundle has `index.en.md` and `index.it.md` from the first commit. Italian is primary; English may lag behind as `draft: true` but the file must exist. Definition and rationale in `docs/piano-evoluzione-blog.md`, section 2.1. Files without a language suffix default to English.
- **Never edit theme files directly.** The theme is a Go module, not vendored. Custom styles go in `assets/css/custom.css`; layout overrides in `layouts/` only when unavoidable.
- **Deploy only via GitHub Actions.** The workflow runs on push to `main`; pull requests build and never deploy. Do not deploy by hand, never commit `public/` or `resources/`.
- **`public/` and `resources/` are gitignored build artifacts.**
- **`examples/` is intentionally NOT published.** Don't "fix" it by moving it back into `content/`.
- **`raw/` and `docs/` are never published.** `raw/` holds source material for republication, `docs/` holds internal documentation.
- **Theme updates are automatic.** A weekly cron updates Stack, builds the site as a gate and commits `CI: Update theme [ci skip]`. Expect `go.mod`/`go.sum` changes; don't revert them unless the build breaks. Such commits never publish on their own.

## Content layout

- `content/post/<slug>/` → `index.en.md` + `index.it.md` (+ optional `cover.jpg`), served at `/p/<slug>/`
- `content/talks/<slug>/` → one bundle per talk, served under `/talks/`
- `content/works/<slug>/` → books and articles, grouped by `group: book|article`, served under `/works/`
- `content/page/<name>/` → about, archives, search; `content/page/resources/` is a branch bundle with `oop/` and `tdd/`
- Slug may differ per language, and should: the English page gets an English slug. Caveat: Hugo publishes bundle images once, under the default language (English) page path, so both language pages reference that path. Harmless today, but if the English page is ever removed the Italian images break, so the content check verifies that every referenced image exists in the build.
- English is the site's base language and lives at the root; Italian lives under `/it/`. This is a deliberate decision (D6 in the plan), not an oversight: do not flip it.
- `assets/icons/` → Tabler Icons SVGs; each must have exactly `width="24" height="24" stroke-width="2" stroke="currentColor"` or it will not render in the menu
- Permalinks: posts at `/p/:slug/`, pages at `/:slug/` (`config/_default/permalinks.toml`)

## Documentation

- `docs/piano-evoluzione-blog.md` — medium and long term plan, numbered tasks (`F` fundamentals, `C` content, `I` information architecture, `M` content engine) with state
- `docs/adr/` — one file per decision about how the site works: context, decision, consequences. Never rewrite an accepted ADR; supersede it
- `docs/contenuti/front-matter.md` — front matter schema for every content type, with examples
- `docs/contenuti/mappatura-mokabyte.md` — the 13 MokaByte articles, their slugs, images and the decisions taken
- `docs/piano-editoriale/` — editorial plan, idea map, voice note register
- `docs/workflow-feedback.md` — friction observed while working, candidates for skills and agents. Add a row there when a task feels repeated or error-prone
- `specs/` — archived feature specs, kept as history, not active work

## Skills

Project skills live in `.opencode/skills/`: `hugo-expert`, `wrap-up`, `journal`, `adr`. The `journal` and `adr` skills define how a session is recorded and how a decision is filed.

## Linting

`.markdownlint.json` disables MD013, MD022, MD031, MD032, MD033, MD034. If you run a markdown linter, don't "fix" those; they are intentionally off.

## Front matter

```yaml
---
title: "Post Title"
description: "One line that explains what the reader gets"
slug: post-slug
date: 2026-10-20
image: cover.jpg          # optional, file inside the bundle
categories: [Software]
tags: [refactoring]
# draft: true             # while working; remove to publish
---
```

Works add `group` and `weight`. Talks add `params.video`. Republications may add `series`, `part`, `source`, `source_date`.
