---
description: "Task list for Jekyll to Hugo content migration"
---

# Tasks: Jekyll to Hugo Content Migration

**Input**: Design documents from `/specs/003-jekyll-migration/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, contracts/

**Tests**: No automated tests requested. Verification will be performed manually using the local Hugo server (`hugo server -D`) and bilingual parity checks.

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and environment verification

- [X] T001 Initialize feature context and verify file paths in `specs/003-jekyll-migration/`
- [X] T002 Verify Hugo local environment is ready for testing with `hugo server -D`

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Prepare the folder structure and global settings for hierarchical content

- [X] T003 Convert Resources from Leaf Bundle to Branch Bundle in `content/page/resources/` (rename `index.it.md` to `_index.it.md` and `index.en.md` to `_index.en.md`)

---

## Phase 3: User Story 1 - Migrating a missing blog post (Priority: P1) 🎯 MVP

**Goal**: Migrate the "Git Essentials on BookAuthority" post from Jekyll archive

**Independent Test**: Verify post appears correctly in Hugo at `/post/git-essentials-on-book-authority/` in both En/It

### Implementation for User Story 1

- [X] T004 [P] [US1] Create leaf bundle directory `content/post/git-essentials-on-book-authority/`
- [X] T005 [US1] Create `index.it.md` in `content/post/git-essentials-on-book-authority/` from Jekyll `_archive/2019-8-14-git-essentials-on-book-authority.md` mapping categories to "Software"
- [X] T006 [US1] Create translated `index.en.md` in `content/post/git-essentials-on-book-authority/`
- [X] T007 [US1] Verify post on local Hugo server in both languages at `/post/git-essentials-on-book-authority/`

**Checkpoint**: User Story 1 (MVP) is fully functional and testable independently

---

## Phase 4: User Story 2 - Unpacking and Migrating Talks (Priority: P1)

**Goal**: Extract each individual talk from the monolithic Jekyll talks list into Hugo leaf bundles

**Independent Test**: Verify each talk directory in `content/talks/` has `index.it.md`, `index.en.md`, and assets

### Implementation for User Story 2

- [X] T008 [P] [US2] Create leaf bundle `content/talks/2023-iad-modelli-realta/` and migrate `Modelli-Realta-IAD-2023.png` from Jekyll `assets/images/`
- [X] T009 [US2] Implement `index.it.md` and `index.en.md` for 2023 IAD talk in `content/talks/2023-iad-modelli-realta/`
- [X] T010 [P] [US2] Create leaf bundle `content/talks/2023-reloaded-podcast-story-points/` and migrate `agile-reloaded-podcast.jpg` from Jekyll `assets/images/`
- [X] T011 [US2] Implement `index.it.md` and `index.en.md` for 2023 Podcast talk in `content/talks/2023-reloaded-podcast-story-points/`
- [X] T012 [P] [US2] Create leaf bundle `content/talks/2022-iad-carbone-software/` and migrate `Dal-carbone-al-software-i-sistemi socio-tecnici-IAD22.png` from Jekyll `assets/images/`
- [X] T013 [US2] Implement `index.it.md` and `index.en.md` for 2022 IAD talk in `content/talks/2022-iad-carbone-software/`
- [X] T014 [US2] Verify all newly unpacked talks on local Hugo server at `/talks/`

**Checkpoint**: All talks from Jekyll are now independently available in Hugo

---

## Phase 5: User Story 3 - Migrating remaining static page content (Works, Resources) (Priority: P1)

**Goal**: Replace "Under construction" placeholders with actual content for Works and individual Resources

**Independent Test**: Verify Works and Resources sub-pages are fully populated and bilingual

### Implementation for User Story 3

- [X] T015 [US3] Migrate content and assets from Jekyll `_pages/works.md` to Hugo `content/page/works/index.it.md`
- [X] T016 [US3] Create translated `index.en.md` for Hugo Works page in `content/page/works/`
- [X] T017 [P] [US3] Create leaf bundle directory `content/page/resources/oop/` and migrate content from Jekyll `_resources/oop.md`
- [X] T018 [US3] Implement `index.it.md` and `index.en.md` for OOP resource in `content/page/resources/oop/`
- [X] T019 [P] [US3] Create leaf bundle directory `content/page/resources/tdd/` and migrate content from Jekyll `_resources/tdd.md`
- [X] T020 [US3] Implement `index.it.md` and `index.en.md` for TDD resource in `content/page/resources/tdd/`
- [X] T021 [US3] Update `content/page/resources/_index.it.md` and `_index.en.md` to remove "Under construction" and ensure sub-pages (OOP, TDD) are automatically listed by the theme's list layout

**Checkpoint**: Works and Resources pages are fully migrated and functional

---

## Phase 6: Polish & Cross-Cutting Concerns

**Purpose**: Site-wide verification and final adjustments

- [X] T022 Cross-check all internal links within newly migrated content in `content/`
- [X] T023 [P] Final audit of bilingual parity across all new bundles in `content/`
- [X] T024 Remove draft status from all migrated items in their respective `index.*.md` files
- [X] T025 [P] Cleanup: Remove migrated source files from the `jesuswasrasta.github.io/` sub-repository to prevent future duplication risks

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately
- **Foundational (Phase 2)**: Depends on Setup completion - BLOCKS all hierarchical content (Resources)
- **User Stories (Phases 3-5)**: Depend on Foundation ready. Can proceed in parallel or sequentially.
- **Polish (Final Phase)**: Depends on all user stories being complete

### Parallel Opportunities

- T004, T008, T010, T012, T017, T019 (Leaf bundle creation and asset migration) can run in parallel.
- US1, US2, and US3 can be worked on in parallel once Phase 2 is complete.
- Bilingual parity audits (T023) can run in parallel across different directories.

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1 & 2
2. Migrate the missing blog post (US1)
3. **VALIDATE**: Verify post integrity on local server
4. Deploy to `main` via PR

### Incremental Delivery

1. Foundation Ready
2. Unpack Talks (US2) -> Test -> Commit
3. Populate Pages (US3) -> Test -> Commit
4. Final Polish (Phase 6) -> Final Verification

---

## Notes

- [P] tasks = different files, no dependencies
- [Story] label maps task to specific user story for traceability
- Every migrated item MUST have En/It versions (Principle I)
- Jekyll permalinks are ignored; only Hugo slugs are used (Opance B decision)
- Category "Posts" is mapped to "Software" (Opance A decision)