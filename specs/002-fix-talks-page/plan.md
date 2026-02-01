# Implementation Plan: Fix messy talks page (Revised)

**Branch**: `002-fix-talks-page` | **Date**: 2026-01-31 | **Spec**: [spec.md](spec.md)
**Input**: Migrate single talks page to a collection of individual pages using the theme's "archive" feature.

## Summary

Refactor the talks content from a single Markdown file into a dedicated collection of individual pages (Page Bundles) in a `talks` section. Use the theme's built-in `layout: archives` to organize them by year, ensuring they remain separate from the main blog posts on the homepage.

## Technical Context

**Language/Version**: Hugo (Extended) ^0.140.2  
**Theme**: hugo-theme-stack/v3  
**Constraints**: 
- **NO custom layouts** or theme modifications.
- **Dedicated files**: One directory/file per talk.
- **Homepage Separation**: Talks must not clutter the main blog feed.
- **Bilingual Parity**: English first, then Italian translation.

## Constitution Check

- [x] Bilingual parity maintained (to be implemented after EN)
- [x] Content-first structure followed (moving to Page Bundles)
- [x] No modification of vendored theme files
- [x] **New Constraint**: No custom layouts in `layouts/`

## Project Structure

### Source Code

```text
content/talks/
├── [year]-[event]-[slug]/
│   ├── index.en.md      # Individual talk page
│   └── [images]         # Local talk assets
└── ...
content/page/talks/
└── index.en.md          # The archive landing page (layout: archives)
```

## Phase 1: Content Extraction (English)

1.  **Extract each Talk**:
    - Iterate through the current `index.en.md`.
    - Create a directory in `content/talks/` for every talk entry.
    - Create an `index.en.md` for each, using the original talk date in the frontmatter.
    - Move associated images from `content/page/talks/img/` to the corresponding talk directory.
2.  **Configure the Section**:
    - Ensure the `talks` section is correctly recognized by the theme.

## Phase 2: Archive Configuration & Separation

1.  **Archive Page**:
    - Update `content/page/talks/index.en.md` to use `layout: archives`.
2.  **Homepage Separation**:
    - **Investigation**: Determine how to include `talks` in the archive logic without having them appear on the homepage.
    - **In Doubt**: If the theme's `archives` layout forces all `mainSections` to appear everywhere (Homepage + Archive), I will ask Nando for preference (e.g., mixing them or using a different grouping strategy) before proceeding with site-wide config changes.

## Phase 3: Italian Translation

1.  Once English is verified, replicate the directory structure for Italian (`index.it.md`).
2.  Translate all titles and descriptions.

## Phase 4: Verification

1.  Verify individual talk pages render correctly.
2.  Verify the `/talks/` archive groups items correctly by year.
3.  Verify the homepage remains focused on blog posts.