# Implementation Plan: Talk Page Layout Review

**Branch**: `001-talk-page-layout` | **Date**: 2026-02-01 | **Spec**: [specs/001-talk-page-layout/spec.md](specs/001-talk-page-layout/spec.md)

## Summary
Refactor talk pages to use the theme's native featured image support for headers and implement custom CSS to render body images as clickable thumbnails. The plan involves updating frontmatter in 27 talks (EN/IT) and adding global styling for the talks section.

## Technical Context

**Language/Version**: Hugo (managed via Go modules), CSS
**Primary Dependencies**: Hugo Theme Stack v3
**Storage**: Markdown files, Static assets
**Testing**: `hugo server -D`, Chrome DevTools verification
**Target Platform**: Web (GitHub Pages)
**Project Type**: Static Site (Hugo)
**Performance Goals**: Responsive images, no layout shifts
**Constraints**: Bilingual parity (EN/IT), Theme Integrity (no vendored file edits)

## Constitution Check

*GATE: Passed.*

1. **Bilingual Content Parity**: Changes will be applied to both `index.en.md` and `index.it.md` for all 27 talks.
2. **Content-First Structure**: All content remains in `content/talks/`.
3. **Theme Integrity**: No theme files modified. All styles go to `assets/css/custom.css`.
4. **Automated Deployment**: Standard GitHub Actions flow.
5. **Simplicity & Focus**: Using standard CSS and Markdown.

## Project Structure

### Documentation (this feature)

```text
specs/001-talk-page-layout/
├── plan.md              # This file
├── research.md          # Research findings
├── data-model.md        # Data requirements
├── quickstart.md        # Usage guide
└── checklists/
    └── requirements.md  # Quality checklist
```

### Source Code

```text
content/talks/
├── [slug]/
│   ├── index.en.md
│   ├── index.it.md
│   └── cover.jpg

assets/css/
└── custom.css           # Styling for thumbnails
```

**Structure Decision**: Standard Hugo Page Bundles for content, `assets/css/` for global overrides.

## Complexity Tracking

*No constitution violations detected.*