# Implementation Plan: Update Hugo Server Version

**Branch**: `001-update-hugo` | **Date**: 2025-01-31 | **Spec**: [spec.md](./spec.md)
**Input**: Feature specification from `/specs/001-update-hugo/spec.md`

## Summary

Update Hugo version from inconsistent state (deploy uses "latest", update-theme uses 0.115.2) to a pinned 0.140.2 across both workflows. Also update Go from 1.17 to 1.23 to meet Hugo 0.140.x requirements.

## Technical Context

**Language/Version**: YAML (GitHub Actions workflows)
**Primary Dependencies**: peaceiris/actions-hugo@v2, actions/setup-go@v4
**Storage**: N/A
**Testing**: Manual local build + CI workflow runs
**Target Platform**: GitHub Actions (Ubuntu latest)
**Project Type**: Configuration change (CI/CD workflows)
**Performance Goals**: Build completes in under 2 minutes
**Constraints**: Must maintain compatibility with Hugo Theme Stack v3
**Scale/Scope**: 2 workflow files, ~10 lines changed total

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

| Principle | Status | Notes |
|-----------|--------|-------|
| I. Bilingual Content Parity | N/A | No content changes |
| II. Content-First Structure | N/A | No content changes |
| III. Theme Integrity | ✅ Pass | Hugo 0.140.2 compatible with Stack v3 (requires ≥0.87.0) |
| IV. Automated Deployment | ✅ Pass | Both workflows updated, CI remains single deployment path |
| V. Simplicity & Focus | ✅ Pass | Minimal changes, no unnecessary complexity |

**Gate Result**: PASS - No violations

## Project Structure

### Documentation (this feature)

```text
specs/001-update-hugo/
├── spec.md              # Feature specification
├── plan.md              # This file
├── research.md          # Version selection rationale
├── checklists/
│   └── requirements.md  # Spec quality validation
└── quickstart.md        # Validation steps
```

### Source Code (repository root)

```text
.github/workflows/
├── deploy.yml           # Main deployment workflow (MODIFY)
└── update-theme.yml     # Theme update workflow (MODIFY)
```

**Structure Decision**: Configuration-only change affecting 2 existing workflow files. No new files or directories needed.

## Implementation Details

### Changes to deploy.yml

**Current**:
```yaml
- uses: actions/setup-go@v4
  with:
    go-version: "^1.17.0"

- name: Setup Hugo
  uses: peaceiris/actions-hugo@v2
  with:
    hugo-version: "latest"
    extended: true
```

**Target**:
```yaml
- uses: actions/setup-go@v4
  with:
    go-version: "^1.23.0"

- name: Setup Hugo
  uses: peaceiris/actions-hugo@v2
  with:
    hugo-version: "0.140.2"
    extended: true
```

### Changes to update-theme.yml

**Current**:
```yaml
- name: Setup Hugo
  uses: peaceiris/actions-hugo@v2
  with:
    hugo-version: 0.115.2
    extended: true
```

**Target** (add Go setup + update Hugo):
```yaml
- uses: actions/setup-go@v4
  with:
    go-version: "^1.23.0"

- name: Setup Hugo
  uses: peaceiris/actions-hugo@v2
  with:
    hugo-version: "0.140.2"
    extended: true
```

## Complexity Tracking

No violations to justify - implementation is straightforward configuration change.
