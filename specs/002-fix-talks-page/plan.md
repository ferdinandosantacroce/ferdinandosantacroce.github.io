# Implementation Plan: Fix messy talks page

**Branch**: `002-fix-talks-page` | **Date**: 2026-01-31 | **Spec**: [spec.md](spec.md)
**Input**: Feature specification from `/specs/002-fix-talks-page/spec.md`

## Summary

Synchronize English and Italian talks pages and standardize the layout using a consistent Markdown pattern for all 20+ talk entries (2016-2022).

## Technical Context

**Language/Version**: Hugo (Extended) ^0.140.2  
**Theme**: hugo-theme-stack/v3  
**Project Type**: Static Site (Hugo)  
**Performance Goals**: CLS < 0.1, Mobile load < 2s  
**Constraints**: Bilingual parity, strictly Markdown (no custom shortcodes)

## Constitution Check

- [x] Bilingual parity maintained
- [x] Content-first structure followed
- [x] No modification of vendored theme files

## Project Structure

### Documentation (this feature)

```text
specs/002-fix-talks-page/
├── plan.md              # This file
├── research.md          # Layout standardization research
├── checklists/
│   └── requirements.md  # Spec quality checklist
└── tasks.md             # Implementation tasks (to be created)
```

### Source Code

```text
content/page/talks/
├── index.en.md          # Primary content (English)
├── index.it.md          # Translated content (Italian)
└── img/                 # Talk-related assets
```

## Phase 1: Standardization & Translation

1. **Phase 1.1: English Content Cleanup**
   - Apply the "Talk Entry" pattern to all entries in `index.en.md`.
   - Remove raw HTML `<a>` and `<img>` tags.
   - Standardize link descriptions.

2. **Phase 1.2: Italian Content Implementation**
   - Copy cleaned English content to `index.it.md`.
   - Translate all translatable text (titles, descriptions, event names if localized).
   - Ensure metadata (frontmatter) is correctly localized.

## Phase 2: Verification

1. **Phase 2.1: Visual Audit**
   - Run Hugo server and verify both `/en/talks/` and `/it/talks/`.
   - Check mobile responsiveness.

2. **Phase 2.2: Link & Image Audit**
   - Verify all local image paths are correct.
   - Verify all external links work.
