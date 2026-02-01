# Quickstart: Update Hugo Server Version

## Prerequisites

- Hugo 0.140.2 extended installed locally (for verification)
- Go 1.23+ installed locally
- Git access to the repository

## Local Verification Steps

### 1. Install Hugo 0.140.2 (if not already installed)

```bash
# macOS with Homebrew
brew install hugo

# Or specific version
brew install hugo@0.140

# Verify version
hugo version
# Expected: hugo v0.140.2+extended ...
```

### 2. Test Local Build

```bash
# Development server with drafts
hugo server -D

# Production build
hugo --minify --gc
```

**Expected**: No errors or deprecation warnings.

### 3. Verify Theme Compatibility

```bash
# Update theme modules
hugo mod get -u github.com/CaiJimmy/hugo-theme-stack/v3
hugo mod tidy
```

**Expected**: Theme updates without errors.

## CI Verification

After pushing the workflow changes:

### 1. Verify Deploy Workflow

1. Push to `main` branch or create PR
2. Check Actions tab for "Deploy to Github Pages" workflow
3. Verify Hugo version in build logs shows `0.140.2`
4. Verify Go version shows `1.23.x`

### 2. Verify Theme Update Workflow

1. Manually trigger "Update theme" workflow from Actions tab
2. Check logs for Hugo version `0.140.2`
3. Verify `hugo mod get -u` and `hugo mod tidy` succeed

## Success Criteria Checklist

- [ ] Local `hugo server -D` starts without errors
- [ ] Local `hugo --minify --gc` builds successfully
- [ ] Deploy workflow shows Hugo 0.140.2 in logs
- [ ] Update-theme workflow shows Hugo 0.140.2 in logs
- [ ] Both workflows show Go 1.23.x in logs
- [ ] Site renders correctly after deployment
- [ ] Theme update workflow can update the Stack theme

## Rollback

If issues occur, revert the workflow files to previous versions:

```bash
git checkout HEAD~1 -- .github/workflows/deploy.yml .github/workflows/update-theme.yml
git commit -m "revert: Hugo version update due to [issue]"
git push
```
