# Tasks: Fix messy talks page

## Phase 1: Preparation & Audit

- [ ] **T-001**: Run a full visual audit of the current Talks page (English/Italian) to identify all messy elements.
- [ ] **T-002**: Backup the current `index.en.md` and `index.it.md` files.

## Phase 2: Implementation (Standardization)

- [ ] **T-003**: Standardize `index.en.md` layout:
    - Group by year using `## [Year]` headers.
    - Each talk entry should use a consistent Markdown list format.
    - Standardize resource links (Video, Slides, Code) with icons/emojis.
    - Standardize or remove inconsistent thumbnails to match "Archive" aesthetic.
- [ ] **T-004**: Synchronize `index.it.md`:
    - Replace "Under construction" with the full content from the English version.
    - Translate talk titles and descriptions.
    - Ensure frontmatter parity (tags, categories, images).

## Phase 3: Verification

- [ ] **T-005**: Verify 100% content parity between English and Italian versions.
- [ ] **T-006**: Run Hugo server and test rendering on both desktop and mobile.
- [ ] **T-007**: Verify all links (videos, slides, repositories) are functional.
- [ ] **T-008**: Verify layout performance (no CLS from missing image dimensions).
- [ ] **T-009**: Commit changes on the `002-fix-talks-page` branch.
