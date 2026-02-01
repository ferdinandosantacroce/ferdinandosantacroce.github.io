# Tasks: Talk Page Layout Review

**Input**: Design documents from `/specs/001-talk-page-layout/`
**Prerequisites**: plan.md, spec.md, research.md, data-model.md

**Tests**: Tests are NOT requested for this content-focused feature.

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Global configuration for talk pages

- [ ] T001 Initialize thumbnail styling in `assets/css/custom.css`
- [ ] T002 Verify `mainSections` exclusion in `config/_default/params.toml`

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core content structure validation

**⚠️ CRITICAL**: Consistency in content structure must be ensured before applying layout changes.

- [ ] T003 Audit all 27 talk directories in `content/talks/` for bilingual Page Bundle compliance (`index.en.md` / `index.it.md`)
- [ ] T004 [P] Standardize `categories` (MUST include `talks`) in all `content/talks/*/index.*.md`

**Checkpoint**: Content structure is standardized - visual revisions can now begin.

---

## Phase 3: User Story 1 - Talk Page Visual Consistency (Priority: P1) 🎯 MVP

**Goal**: Ensure individual talk pages follow a consistent and professional article layout.

**Independent Test**: Navigate to `/talks/2022-tdd-milano-refactoring-showdown/` and confirm sidebar and typography match blog posts.

### Implementation for User Story 1

- [ ] T005 [US1] Verify that `layouts/talks/list.html` correctly handles the section-level archive view
- [ ] T006 [US1] Standardize frontmatter `date` and `title` formatting in all `content/talks/*/index.*.md`
- [ ] T007 [US1] Ensure all talk pages correctly display the sidebar as defined in `config/_default/params.toml`

**Checkpoint**: Talk pages are now visually consistent with the rest of the site.

---

## Phase 4: User Story 2 - Image Handling and Alignment (Priority: P2)

**Goal**: Images within talk descriptions are properly sized and responsive.

**Independent Test**: Resize browser window on a talk page with body images and confirm no horizontal overflow.

### Implementation for User Story 2

- [ ] T008 [P] [US2] Add `.talk-thumbnail` class and responsive rules to `assets/css/custom.css`
- [ ] T009 [US2] Apply thumbnail constraints to all images within the `.article-post` container for the talks section in `assets/css/custom.css`

**Checkpoint**: Images in talk descriptions are now responsive and properly aligned.

---

## Phase 5: User Story 3 - Cover Image and Interactive Body Media (Priority: P3)

**Goal**: Prominent Featured Images in the header and clickable thumbnails in the body.

**Independent Test**: Verify that the top of the page shows a Hero image and that body images are clickable links.

### Implementation for User Story 3

- [ ] T010 [P] [US3] Map frontmatter `image` to a valid local file for all 27 talks in `content/talks/*/index.en.md`
- [ ] T011 [P] [US3] Map frontmatter `image` to a valid local file for all 27 talks in `content/talks/*/index.it.md`
- [ ] T012 [US3] Refactor markdown body to use `[![alt](img)](url)` syntax in all `content/talks/*/index.*.md`
- [ ] T013 [US3] Verify that the Stack theme correctly renders the `image` param as a Featured Image in the single talk view.

**Checkpoint**: All talk pages now feature cover images and interactive body media.

---

## Phase 6: Polish & Cross-Cutting Concerns

**Purpose**: Final verification and documentation

- [ ] T014 [P] Update `specs/001-talk-page-layout/quickstart.md` with finalized CSS classes
- [ ] T015 Run final site build `hugo --minify --gc` to check for errors
- [ ] T016 Perform cross-language parity check for all 27 talks

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup & Foundational**: MUST be completed first to stabilize the environment.
- **US1 (P1)**: The primary visual structure must be validated first.
- **US2 & US3**: Can be worked on in parallel once the foundation and US1 are stable.

### Parallel Opportunities

- T004 (Standardizing categories) can be done in parallel with T001/T002.
- T010 and T011 (Configuring image frontmatter for EN/IT) are perfectly parallelizable.
- CSS work (T008) can be done independently of content updates.

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Setup and Foundational audits.
2. Ensure talks list and single views render correctly with sidebar.
3. **STOP and VALIDATE**: Confirm talks are accessible and visually consistent with blog posts.

### Incremental Delivery

1. Foundation: Clean up all frontmatter and folder structures.
2. Styling: Add global thumbnail rules to CSS.
3. Content Enhancement: Progressively update talk body markdown to use linked thumbnails and cover images.
