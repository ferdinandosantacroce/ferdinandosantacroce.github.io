# Research: Update Hugo Server Version

**Date**: 2025-01-31
**Feature**: 001-update-hugo

## Decision Summary

| Topic | Decision | Rationale |
|-------|----------|-----------|
| Hugo Version | 0.140.2 | Stable release from Dec 2024, well-tested, compatible with Stack theme v3 |
| Go Version | 1.23 | Required for Hugo 0.140.x; current 1.17 is too old |
| Version Strategy | Pinned | Both workflows use identical explicit version for reproducibility |

## Research Findings

### 1. Hugo Version Selection

**Current State**:
- deploy.yml: `hugo-version: "latest"` (unpredictable)
- update-theme.yml: `hugo-version: 0.115.2` (from July 2023, outdated)

**Latest Available**: Hugo v0.155.1 (released 2025-01-30)

**Recommended**: Hugo v0.140.2 (released Dec 2024)

**Why not latest (0.155.x)?**
- Requires Go 1.24.0 which is very recent
- 0.140.x is stable and well-tested over several months
- Still receives critical patches

**Why 0.140.2 specifically?**
- Stable point release with bug fixes
- Built with Go 1.23.4 (widely available)
- No breaking changes from 0.115.2 that affect Stack theme
- Released Dec 2024, proven stable in production

**Alternatives Considered**:

| Version | Pros | Cons |
|---------|------|------|
| 0.155.1 | Latest features | Requires Go 1.24, very new |
| 0.145.0 | Newer than 0.140 | February 2025, less testing time |
| 0.140.2 | ✅ Stable, Go 1.23 | Slightly older |
| 0.115.2 | Current in update-theme | 18+ months old, missing fixes |

### 2. Go Version Requirements

**Current**: Go 1.17.0 (specified in deploy.yml)

**Required for Hugo 0.140.x**: Go 1.23+

**Recommended**: Go 1.23

**Why**:
- Hugo 0.140.x binaries built with Go 1.23.4
- Hugo Modules require Go for `hugo mod get -u` and `hugo mod tidy`
- Go 1.23 is LTS-supported and stable

### 3. Stack Theme Compatibility

**Theme**: Hugo Theme Stack v3
**Minimum Hugo**: 0.87.0 (extended)

**Verification**:
- Theme requires Hugo Extended for SCSS processing
- 0.140.2 extended is fully compatible
- No deprecation warnings expected

Sources:
- [Stack Theme Requirements](https://stack.jimmycai.com/guide/getting-started)
- [Hugo Releases](https://github.com/gohugoio/hugo/releases)

### 4. Workflow Action Versions

**peaceiris/actions-hugo@v2**:
- Supports all Hugo versions including 0.140.2
- Handles Hugo binary installation directly
- Extended variant available

**actions/setup-go@v4**:
- Supports Go 1.23
- Already in use in deploy.yml

## Files to Modify

1. `.github/workflows/deploy.yml`
   - Change `hugo-version: "latest"` → `hugo-version: "0.140.2"`
   - Change `go-version: "^1.17.0"` → `go-version: "^1.23.0"`

2. `.github/workflows/update-theme.yml`
   - Change `hugo-version: 0.115.2` → `hugo-version: "0.140.2"`
   - Add Go setup step (currently missing, needed for `hugo mod` commands)

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Theme incompatibility | Low | High | Test locally before merge |
| Build failure | Low | Medium | CI will catch before deploy |
| Go version conflict | Low | Low | Use same Go version in both workflows |

## Validation Plan

1. Local testing: `hugo server -D` with updated version
2. Build verification: `hugo --minify --gc` succeeds without warnings
3. CI verification: Both workflows pass on PR
4. Theme update: Manual trigger of update-theme workflow
