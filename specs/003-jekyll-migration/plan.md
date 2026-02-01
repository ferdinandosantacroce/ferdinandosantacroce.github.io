# Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]` | **Date**: [DATE] | **Spec**: [link]
**Input**: Feature specification from `/specs/[###-feature-name]/spec.md`

**Note**: This template is filled in by the `/speckit.plan` command. See `.specify/templates/commands/plan.md` for the execution workflow.

## Summary

Migrate the remaining content from the legacy Jekyll blog to Hugo, ensuring architectural consistency and strict bilingual parity. This includes migrating a missing blog post, unpacking talks into individual leaf bundles, and converting the Resources section into a branch bundle structure to support nested pages (OOP, TDD).

## Technical Context

**Language/Version**: Hugo (latest compatible with Theme Stack v3), Go Modules  
**Primary Dependencies**: Hugo Theme Stack v3  
**Storage**: Local Markdown files and co-located assets (leaf bundles)  
**Testing**: Local verification via `hugo server -D`, manual bilingual parity audit  
**Target Platform**: GitHub Pages (via GitHub Actions)
**Project Type**: Personal Blog (Static Site)  
**Performance Goals**: N/A (Static site build performance)
**Constraints**: 
- Strict bilingual parity (En/It) for all content.
- Leaf bundle architecture for posts/talks.
- Branch bundle architecture for collections (Resources).
**Scale/Scope**: 1 post, 3 talks to unpack, 2 resource pages to migrate.

## Constitution Check

*GATE: All checks PASS.*

- **Principle I: Bilingual Content Parity**: Design explicitly requires `index.en.md` and `index.it.md` for all new bundles. (PASS)
- **Principle II: Content-First Structure**: All targets follow `content/post/`, `content/page/`, or `content/talks/` standards. (PASS)
- **Principle III: Theme Integrity**: Slugs and metadata follow Stack theme expectations. (PASS)
- **Principle IV: Automated Deployment**: Migration handled via standard git flow, deploying through GitHub Actions. (PASS)
- **Principle V: Simplicity & Focus**: Migrating professional content only, removing placeholders. (PASS)

## Project Structure

### Documentation (this feature)

```text
specs/003-jekyll-migration/
├── plan.md              # This file
├── research.md          # Phase 0 output
├── data-model.md        # Phase 1 output
├── quickstart.md        # Phase 1 output
└── tasks.md             # Phase 2 output
```

### Source Code

```text
content/
├── post/
│   └── git-essentials-on-book-authority/  # Leaf bundle
│       ├── index.en.md
│       └── index.it.md
├── page/
│   ├── works/                             # Updated leaf bundle
│   │   ├── index.en.md
│   │   └── index.it.md
│   └── resources/                         # Branch bundle
│       ├── _index.en.md
│       ├── _index.it.md
│       ├── oop/                           # Leaf bundle
│       │   ├── index.en.md
│       │   └── index.it.md
│       └── tdd/                           # Leaf bundle
│           ├── index.en.md
│           └── index.it.md
└── talks/
    ├── 2023-iad-modelli-realta/           # Unpacked leaf bundle
    ├── 2023-reloaded-podcast-story-points/ # Unpacked leaf bundle
    └── 2022-iad-carbone-software/         # Unpacked leaf bundle
```

**Structure Decision**: Using **Leaf Bundles** for all standalone content (posts, individual talks, works) and a **Branch Bundle** for the Resources section to support its hierarchical nature.

## Complexity Tracking

> **Fill ONLY if Constitution Check has violations that must be justified**

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| [e.g., 4th project] | [current need] | [why 3 projects insufficient] |
| [e.g., Repository pattern] | [specific problem] | [why direct DB access insufficient] |
