# Feature Specification: Update Hugo Server Version

**Feature Branch**: `001-update-hugo`
**Created**: 2025-01-31
**Status**: Draft
**Input**: User description: "Update Hugo Server version"

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Consistent Hugo Version Across Workflows (Priority: P1)

As a blog maintainer, I want all GitHub Actions workflows to use the same Hugo version so that builds are reproducible and I avoid version mismatch issues between deployment and theme updates.

**Why this priority**: Version inconsistency between workflows can cause subtle build differences or failures. The deploy workflow uses "latest" while update-theme uses a pinned 0.115.2, creating unpredictable behavior.

**Independent Test**: Can be fully tested by triggering both workflows and verifying they report the same Hugo version in their logs.

**Acceptance Scenarios**:

1. **Given** both deploy.yml and update-theme.yml workflows exist, **When** either workflow runs, **Then** both use the identical Hugo version number.
2. **Given** a workflow run completes, **When** checking the build logs, **Then** the Hugo version is clearly visible and matches the configured version.

---

### User Story 2 - Up-to-Date Hugo Version (Priority: P2)

As a blog maintainer, I want to use a recent stable Hugo version so that I benefit from bug fixes, security patches, and new features while maintaining compatibility with the Stack theme.

**Why this priority**: Running outdated software creates technical debt and potential security risks. However, this is secondary to consistency since an inconsistent setup causes immediate problems.

**Independent Test**: Can be fully tested by building the site locally with the new version and verifying all pages render correctly.

**Acceptance Scenarios**:

1. **Given** Hugo is updated to a recent version, **When** the site builds, **Then** all existing content renders without errors.
2. **Given** the new Hugo version, **When** running `hugo server -D`, **Then** the development server starts and serves content correctly.
3. **Given** the new Hugo version, **When** the theme update workflow runs, **Then** the Stack theme v3 remains compatible.

---

### Edge Cases

- What happens when the chosen Hugo version is incompatible with the Stack theme? The theme documentation and release notes must be checked for minimum Hugo version requirements.
- How does the system handle a Hugo version that deprecates features used by the theme? Build warnings should be reviewed during local testing before deployment.
- What if Go version requirements change with newer Hugo versions? The Go setup step in workflows may need adjustment.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: Both GitHub Actions workflows (deploy.yml and update-theme.yml) MUST specify the same explicit Hugo version number.
- **FR-002**: The Hugo version MUST be pinned to a specific version number (not "latest") for reproducibility.
- **FR-003**: The chosen Hugo version MUST be compatible with Hugo Theme Stack v3.
- **FR-004**: The Hugo version MUST be the "extended" variant to support SCSS processing.
- **FR-005**: The Go version in workflows MUST meet the minimum requirements for the chosen Hugo version.

### Assumptions

- The Stack theme v3 supports Hugo versions up to the latest stable release (typical for well-maintained themes).
- Hugo extended is available for the target version (standard for all recent releases).
- No custom shortcodes or templates depend on deprecated Hugo features.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Both workflows report identical Hugo version numbers in their build logs.
- **SC-002**: Site builds successfully without errors or deprecation warnings on both local development and CI.
- **SC-003**: All existing blog posts and pages render correctly with the updated version.
- **SC-004**: Theme update workflow continues to function and can update the Stack theme.
- **SC-005**: Local development server (`hugo server -D`) starts within 5 seconds and serves all content.
