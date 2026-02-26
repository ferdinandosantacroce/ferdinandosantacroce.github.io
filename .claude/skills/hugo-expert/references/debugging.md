# Debugging Guide

## Phase 1: Version Compatibility

Always start here.

```bash
hugo version
```

- Version `< 0.146.0`: template lookup order is different — warn about incompatibilities.
- No `extended` in output: Sass/WebP processing unavailable.

## Phase 2: "Content Not Showing"

**Symptom:** Posts/pages missing from list pages.

**Diagnosis:**
1. Check for `index.md` at the section root (e.g., `content/blog/index.md`).
2. If present: this is a Leaf Bundle — it cannot contain child pages.

**Fix:** Rename `content/blog/index.md` → `content/blog/_index.md` to create a Branch Bundle.

Also check:
- `draft: true` in front matter (drafts hidden in production)
- `publishDate` set to a future date
- `expiryDate` set to a past date

## Phase 3: "Wrong Layout / Broken Layout"

**Symptom:** Homepage renders as a generic list, or wrong template applied.

**Diagnosis:**
1. Identify the page Kind: `home`, `section`, `taxonomy`, `term`, `page`.
2. Check for `layouts/index.html` — this is now a Single Page template, not homepage.
3. Run `hugo --templateMetrics` to see which template is being used.

**Fix for homepage:** Rename `layouts/index.html` → `layouts/home.html`.

## Phase 4: Cache and Draft Issues

When nothing else explains the problem:

```bash
hugo server --disableFastRender --ignoreCache -D
```

- `--disableFastRender`: rebuild everything on each change
- `--ignoreCache`: ignore cached resources
- `-D`: include drafts

## Phase 5: Module Issues

If theme/module content is missing:

```bash
hugo mod graph        # show module dependency graph
hugo mod verify       # verify module checksums
hugo mod tidy         # remove unused modules
```

Check `go.mod` and `go.sum` are present and up to date.

## Useful Diagnostic Commands

```bash
hugo --templateMetrics          # which templates render which pages
hugo --templateMetricsHints     # plus optimization hints
hugo list drafts                # list all draft content
hugo list future                # list future-dated content
hugo list expired               # list expired content
```
