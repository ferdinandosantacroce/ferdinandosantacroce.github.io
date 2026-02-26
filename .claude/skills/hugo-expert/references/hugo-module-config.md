# Hugo Module Configuration

## Why Hugo Modules

Hugo Modules (Go Modules) replace git submodules. Benefits:
- Semantic versioning
- Transitive dependencies
- Vendor support (`hugo mod vendor`)
- No `.gitmodules` fragility

## Initializing a Module

```bash
hugo mod init github.com/<user>/<project>
```

This creates `go.mod` and `go.sum`. Commit both.

## Adding a Theme

In `hugo.toml` (or `config/_default/module.toml`):

```toml
[module]
  [[module.imports]]
    path = "github.com/CaiJimmy/hugo-theme-stack/v3"
    disable = false

  [module.hugoVersion]
    extended = true
    min = "0.146.0"
```

Then run:

```bash
hugo mod tidy
```

## Updating a Theme

```bash
hugo mod get -u github.com/CaiJimmy/hugo-theme-stack/v3
hugo mod tidy
```

Or update all modules:

```bash
hugo mod get -u ./...
hugo mod tidy
```

## Vendoring (Offline/CI Use)

```bash
hugo mod vendor
```

Creates `_vendor/` directory. Add to `.gitignore` or commit depending on policy. Use `hugo --ignoreVendorPaths` to skip vendoring in dev.

## Mounting Assets from Modules

Add custom mount points to access module assets alongside your own:

```toml
[module]
  [[module.mounts]]
    source = "assets"
    target = "assets"
  [[module.mounts]]
    source = "static"
    target = "static"
  [[module.imports]]
    path = "github.com/user/theme"
```

## Common Issues

| Issue | Fix |
|---|---|
| `go.mod` not found | Run `hugo mod init github.com/<user>/<project>` |
| Theme changes not visible | Run `hugo mod get -u <path>` then `hugo mod tidy` |
| Build fails in CI | Add `hugo mod vendor` step or ensure Go is installed |
| Checksum mismatch | Run `hugo mod verify` then `hugo mod tidy` |
