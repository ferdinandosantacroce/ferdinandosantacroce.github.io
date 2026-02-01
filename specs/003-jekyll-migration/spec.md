# Feature Specification: Jekyll to Hugo Content Migration

**Feature Branch**: `003-jekyll-migration`  
**Created**: Sunday, February 1, 2026  
**Status**: Draft  
**Input**: User description: "convertire le pagine e i post lì presenti da Jekyll a Hugo, evitando di creare duplicati. Fai una analisi, specialmente delle cartelle jesuswasrasta.github.io/_posts/** e jesuswasrasta.github.io/_pages/** e preparati per eseguire la migrazione. La faremo passo passo, una pagina o post alla volta, riflettendo di volta in volta su contenuti e organizzazione."

## Clarifications

### Session 2026-02-01
- Q: Gestione degli asset mancanti (immagini) → A: Sorgente in `jesuswasrasta.github.io/assets/images/**`; segnalare errore per intervento manuale se ancora mancanti.
- Q: Gestione dei vecchi link (Permalink) → A: Utilizzare solo i nuovi slug di Hugo, ignorando i vecchi permalink.
- Q: Traduzione dei Talk "spacchettati" → A: Tradurre ogni talk dall'italiano all'inglese durante lo spacchettamento.
- Q: Struttura della pagina "Risorse" → A: Branch Bundle: Pagina indice `_index.md` con sotto-pagine individuali per OOP e TDD.
- Q: Mappatura delle Categorie → A: Mappare la categoria Jekyll "Posts" alla categoria Hugo "Software".

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Migrating a missing blog post (Priority: P1)

As a site owner, I want to migrate a blog post that was left behind in the old Jekyll repository into the new Hugo structure, ensuring it's available in both English and Italian.

**Why this priority**: The primary goal is to complete the migration of all content without losing any information. This is the first step to verify the migration process.

**Independent Test**: Can be fully tested by migrating "BookAuthority rewards my Git Essentials book" and verifying its presence on the local Hugo server in both languages.

**Acceptance Scenarios**:

1. **Given** the Jekyll post `jesuswasrasta.github.io/_archive/2019-8-14-git-essentials-on-book-authority.md`, **When** migrated to Hugo, **Then** it should exist as `content/post/git-essentials-on-book-authority/index.en.md` and `index.it.md`.
2. **Given** the migrated post, **When** viewed in Hugo, **Then** the front matter must be correctly converted (TOML/YAML standard for Hugo Stack theme) and all internal links/images must work.

---

### User Story 2 - Unpacking and Migrating Talks (Priority: P1)

As a site owner, I want to extract each individual talk listed in the old Jekyll `talks.md` and convert them into independent Hugo leaf bundles within `content/talks/`, following the existing project structure.

**Why this priority**: The current Hugo `talks` section is incomplete compared to the Jekyll version. Unpacking them into individual bundles allows for better metadata management, individual filtering, and consistent styling across the site.

**Independent Test**: Can be tested by verifying that for every talk entry in the Jekyll `talks.md` (e.g., "Italian Agile Days 2023"), a corresponding directory exists in `content/talks/` (e.g., `2023-iad-modelli-realta/`) containing both `index.en.md` and `index.it.md`.

**Acceptance Scenarios**:

1. **Given** an entry in Jekyll's `talks.md` that is not yet in Hugo (e.g., the 2023 talks), **When** migrated, **Then** a new leaf bundle directory must be created using the format `YYYY-[event]-[short-title]`.
2. **Given** a new talk bundle, **When** created, **Then** it must contain:
    - `index.it.md`: The Italian version of the talk description.
    - `index.en.md`: The English translation (translated from Italian if necessary).
    - Local assets: Any images or specific media referenced in that talk entry.
3. **Given** the front matter of the new talk files, **When** populated, **Then** it must include `title`, `date` (approximate based on the year/event), `categories`, `tags`, and any relevant `params` (e.g., video links).

---

### User Story 3 - Migrating remaining static page content (Works, Resources) (Priority: P1)

As a site owner, I want to migrate the rich content from my old Jekyll pages (Works and Resources) to the corresponding Hugo pages, replacing the current "Under construction" placeholders.

**Why this priority**: These pages contain the bulk of my professional history, books, and collections.

**Independent Test**: Can be tested by verifying that the Hugo `works` and `resources` sections are fully populated with the content from Jekyll.

**Acceptance Scenarios**:

1. **Given** the Jekyll `works.md`, **When** migrated, **Then** `content/page/works/index.it.md` and `index.en.md` must contain the professional production details.
2. **Given** the Jekyll `_resources/` collection, **When** migrated, **Then** the Hugo resources section must be fully populated (integrating `oop.md` and `tdd.md`).

---

### User Story 4 - Ensuring Bilingual Parity (Priority: P1)

As a site owner, I want to ensure that every piece of migrated content exists in both English and Italian to maintain the site's "Strict bilingual parity" principle.

**Why this priority**: This is a core principle of the project (The Constitution).

**Independent Test**: Every new content directory must contain both an `.en.md` and an `.it.md` file before the task is considered complete.

**Acceptance Scenarios**:

1. **Given** a new content bundle, **When** checked for parity, **Then** both English and Italian versions must exist.

---

### Edge Cases

- **Mixed content in one file**: Jekyll pages often contain both languages or reference a translation. Hugo needs separate files.
- **Broken internal links**: Permalinks in Jekyll might not match Hugo's structure (e.g., `/:categories/:title/` vs Hugo slugs).
- **Missing assets**: Images referenced in Jekyll posts might need to be moved to the local Hugo bundle (leaf bundle assets).

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: System MUST convert Jekyll front matter (YAML) to Hugo-compatible front matter using exclusively YAML format, as per Stack theme content standards.
- **FR-002**: Every migrated post MUST be placed in a directory (leaf bundle) to manage its specific assets (images, etc.).
- **FR-003**: System MUST identify and migrate referenced images from the old `assets/images/` directory to the new post's bundle or Hugo's `assets/img/`.
- **FR-004**: System MUST ensure that no duplicate content is created if a page/post already exists in Hugo.
- FR-005**: All migrated content MUST satisfy the project's bilingual parity rule.
- **FR-006**: System MUST map the legacy category "Posts" to the current "Software" category.
- **FR-007**: The "Resources" section MUST be converted into a branch bundle structure to support independent sub-pages.

### Key Entities *(include if feature involves data)*

- **Content Bundle**: A Hugo leaf bundle containing `index.en.md`, `index.it.md`, and local assets.
- **Front Matter**: Metadata at the top of Markdown files defining title, date, description, image, and categories.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: 100% of targeted Jekyll posts and resources are migrated to the Hugo structure.
- **SC-002**: Zero broken links or missing images in the newly migrated content when viewed on the local server.
- **SC-003**: 100% compliance with the bilingual parity rule (En/It pairs for all new files).
- **SC-004**: No "Under construction" placeholders remain in the target migration pages.