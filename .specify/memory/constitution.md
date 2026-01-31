<!--
SYNC IMPACT REPORT
==================
Version change: (none) → 1.0.0
Added principles:
  - I. Bilingual Content Parity
  - II. Content-First Structure
  - III. Theme Integrity
  - IV. Automated Deployment
  - V. Simplicity & Focus
Added sections:
  - Content Standards
  - Workflow
Templates checked:
  ✅ .specify/templates/plan-template.md - Generic, no updates needed
  ✅ .specify/templates/spec-template.md - Generic, no updates needed
  ✅ .specify/templates/tasks-template.md - Generic, no updates needed
Follow-up TODOs: None
==================
-->

# Ferdinando Santacroce Blog Constitution

## Core Principles

### I. Bilingual Content Parity

All published content MUST exist in both English and Italian versions:

- Blog posts use `index.en.md` and `index.it.md` file naming
- Pages follow the same convention
- Each language version MUST be independently complete (no "coming soon" placeholders)
- Translations MUST preserve meaning while adapting cultural context

Rationale: The blog serves both English-speaking software community and Italian audience.

### II. Content-First Structure

Content organization follows Hugo conventions strictly:

- Posts live in `content/post/[slug]/` with cover images co-located
- Pages live in `content/page/[name]/`
- Categories are defined in `content/categories/`
- Front matter MUST include: title, date, categories (for posts)
- Draft content uses `draft: true` front matter, never committed as non-draft incomplete work

Rationale: Predictable structure enables automated workflows and theme compatibility.

### III. Theme Integrity

The Stack theme v3 is managed via Hugo modules:

- Theme customizations MUST NOT modify vendored theme files
- Custom CSS goes in `assets/css/custom.css`
- Icons from Tabler MUST use: `width="24" height="24" stroke-width="2" stroke="currentColor"`
- Configuration changes go in `config/_default/*.toml` files
- Theme updates via `hugo mod get -u` MUST be tested locally before commit

Rationale: Clean separation ensures theme updates don't break customizations.

### IV. Automated Deployment

CI/CD is the single deployment path:

- All deployments happen via GitHub Actions on push to `main`
- Manual deployment to production is NOT permitted
- Build command: `hugo --minify --gc`
- Local development: `hugo server -D` (includes drafts)
- Theme updates run daily via automated workflow

Rationale: Automated pipeline ensures consistent, reproducible builds.

### V. Simplicity & Focus

This blog focuses on professional content:

- Topics: software development, agile practices, technical coaching
- No unnecessary plugins or JavaScript customizations
- Performance over features: fast load times matter
- Images MUST be optimized (Hugo handles resizing)
- No comments system (social engagement happens elsewhere)

Rationale: A focused, fast blog serves readers better than a feature-heavy one.

## Content Standards

**Post Quality Gates**:

- Title clearly describes the content
- Cover image is present and relevant (optional but recommended)
- Categories assigned from existing set (Software is primary)
- Tags are lowercase, hyphen-separated
- Content is proofread in both languages

**Media Guidelines**:

- Images stored alongside content in post folder
- Prefer JPEG for photos, PNG for diagrams/screenshots
- Maximum source image width: 2000px (Hugo resizes automatically)

## Workflow

**Adding New Content**:

1. Create folder in `content/post/[slug]/`
2. Add `index.en.md` and `index.it.md`
3. Add cover image if desired
4. Test locally with `hugo server -D`
5. Remove `draft: true` when ready
6. Commit and push to main

**Configuration Changes**:

1. Edit appropriate file in `config/_default/`
2. Test locally
3. Commit with descriptive message

## Governance

This constitution guides all development work on the blog. Amendments require:

1. Documented rationale for the change
2. Update to this file with version increment
3. Verification that existing content/config complies

Use `CLAUDE.md` for runtime development guidance and quick reference.

**Version**: 1.0.0 | **Ratified**: 2025-01-31 | **Last Amended**: 2025-01-31
