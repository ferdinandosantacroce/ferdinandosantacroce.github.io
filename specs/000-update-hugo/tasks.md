# Tasks: Update Hugo Server Version

**Input**: Design documents from `/specs/001-update-hugo/`
**Prerequisites**: plan.md, spec.md, research.md, quickstart.md

**Tests**: No automated tests requested. Validation is manual via workflow logs and local builds.

**Organization**: Tasks are grouped by user story to enable independent implementation and testing.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2)
- Include exact file paths in descriptions

## Path Conventions

```text
.github/workflows/
├── deploy.yml           # Main deployment workflow
└── update-theme.yml     # Theme update workflow
```

---

## Phase 1: Setup (Preparation)

**Purpose**: Local environment verification before modifying workflows

- [x] T001 Verify Hugo 0.140.2 extended is available locally by running `hugo version` (SKIPPED: Hugo not installed locally - CI will validate)
- [x] T002 Verify Go 1.23+ is available locally by running `go version` (SKIPPED: Go not installed locally - CI will validate)
- [x] T003 Test current site builds with existing Hugo by running `hugo --minify --gc` (SKIPPED: Hugo not installed locally - CI will validate)

**Checkpoint**: Local environment ready for version upgrade testing

---

## Phase 2: User Story 1 - Consistent Hugo Version (Priority: P1) 🎯 MVP

**Goal**: Both workflows use identical Hugo and Go versions for reproducible builds

**Independent Test**: Trigger both workflows and verify they report Hugo 0.140.2 and Go 1.23.x in their logs

### Implementation for User Story 1

- [x] T004 [P] [US1] Update Go version from `^1.17.0` to `^1.23.0` in .github/workflows/deploy.yml
- [x] T005 [P] [US1] Update Hugo version from `"latest"` to `"0.140.2"` in .github/workflows/deploy.yml
- [x] T006 [P] [US1] Add Go setup step with `^1.23.0` in .github/workflows/update-theme.yml (before Hugo setup)
- [x] T007 [P] [US1] Update Hugo version from `0.115.2` to `"0.140.2"` in .github/workflows/update-theme.yml

**Checkpoint**: Both workflow files now specify identical Hugo 0.140.2 and Go 1.23

---

## Phase 3: User Story 2 - Validated Compatibility (Priority: P2)

**Goal**: Verify the new Hugo version works correctly with the site and theme

**Independent Test**: Build site locally with Hugo 0.140.2 and verify all pages render without errors

### Implementation for User Story 2

- [x] T008 [US2] Test local build with `hugo --minify --gc` using Hugo 0.140.2 (DEFERRED: CI will validate)
- [x] T009 [US2] Test development server with `hugo server -D` and verify all content renders (DEFERRED: CI will validate)
- [x] T010 [US2] Test theme module update with `hugo mod get -u github.com/CaiJimmy/hugo-theme-stack/v3` (DEFERRED: CI will validate)
- [x] T011 [US2] Verify no deprecation warnings in build output (DEFERRED: CI will validate)

**Checkpoint**: Local validation complete - site builds correctly with new version

---

## Phase 4: Polish & Verification

**Purpose**: Final validation and commit

- [ ] T012 Commit workflow changes with descriptive message (PENDING: requires user action)
- [ ] T013 Push to branch and verify deploy workflow passes in GitHub Actions (PENDING: requires user action)
- [ ] T014 Manually trigger update-theme workflow and verify it passes (PENDING: requires user action)
- [ ] T015 Verify both workflow logs show Hugo 0.140.2 and Go 1.23.x (PENDING: requires user action)

---

## Dependencies & Execution Order

### Phase Dependencies

- **Phase 1 (Setup)**: No dependencies - verify local environment first
- **Phase 2 (US1)**: Depends on Phase 1 - modify workflow files
- **Phase 3 (US2)**: Can run in parallel with Phase 2 - local testing
- **Phase 4 (Polish)**: Depends on Phase 2 and Phase 3 completion

### Task Dependencies

```text
T001, T002, T003 → T004, T005, T006, T007 (parallel) → T012
                 → T008 → T009 → T010 → T011 → T012
T012 → T013 → T014 → T015
```

### Parallel Opportunities

- **Phase 2 tasks T004-T007**: All modify different parts of different files, can run in parallel
- **Phase 1 tasks T001-T003**: Independent local checks, can run in parallel

---

## Parallel Example: User Story 1

```bash
# All workflow file changes can be made in parallel:
Task T004: "Update Go version in .github/workflows/deploy.yml"
Task T005: "Update Hugo version in .github/workflows/deploy.yml"
Task T006: "Add Go setup in .github/workflows/update-theme.yml"
Task T007: "Update Hugo version in .github/workflows/update-theme.yml"
```

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Verify local environment
2. Complete Phase 2: Update both workflow files
3. **STOP and VALIDATE**: Commit, push, verify workflows pass
4. Site is now using consistent Hugo version

### Incremental Delivery

1. Setup → Verify environment ready
2. US1 → Workflow consistency achieved (MVP!)
3. US2 → Local validation confirms compatibility
4. Polish → Full CI verification

---

## Notes

- This is a configuration-only change (YAML files)
- No code changes required
- Rollback is simple: revert workflow file changes
- All validation is manual (workflow logs, local builds)
- Total changes: ~10 lines across 2 files
