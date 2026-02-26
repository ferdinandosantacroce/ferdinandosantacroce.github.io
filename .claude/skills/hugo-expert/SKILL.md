---
name: hugo-expert
description: Hugo static site expert for modern Hugo (v0.146+). Use when working on Hugo sites, creating content, fixing templates, configuring assets, debugging build issues, or choosing between Hugo patterns. Enforces Hugo Modules over git submodules, correct template lookup order, and Hugo Pipes for assets.
---

# Hugo Expert

Expert guidance for building and maintaining Hugo static sites using modern best practices (Hugo v0.146+). Corrects obsolete patterns from pre-2024 tutorials.

## When to Use This Skill

- Setting up a new Hugo site or theme
- Adding or fixing templates, layouts, or partials
- Configuring Hugo Pipes (SCSS, JS, images)
- Creating content structures (posts, sections, bundles)
- Debugging "content not showing", "wrong layout", or build errors
- Updating theme dependencies

## Critical Rules (Enforce Always)

| Topic | Anti-pattern | Required |
|---|---|---|
| Theme/module deps | `git submodule add` | Hugo Modules (`hugo mod`) |
| Homepage template | `layouts/index.html` | `layouts/home.html` |
| Basic HTML in Markdown | Shortcodes | Render hooks |
| Sass imports | `@import` | `@use` / `@forward` |
| JS bundling | Webpack/Gulp | `js.Build` (ESBuild) |

## Quick Reference: Content Bundles

- **Leaf Bundle** (`index.md`): terminal page (post). No children.
- **Branch Bundle** (`_index.md`): section/list page. Must have underscore.

Symptom: "my posts aren't showing" → check if `content/blog/index.md` should be `_index.md`.

## Common Workflows

### Add/update a theme via Hugo Modules

1. [ ] Init module if needed: `hugo mod init github.com/<user>/<project>`
2. [ ] Add import to `hugo.toml` (see [[references/hugo-module-config.md]])
3. [ ] Run `hugo mod tidy`
4. [ ] Verify with `hugo server -D`

### Fix a broken layout

1. [ ] Run `hugo version` — check for `extended` and version >= 0.146.0
2. [ ] Identify the content type and output format
3. [ ] Apply the Unified Lookup Order to find the correct template path
4. [ ] For homepage: ensure file is `layouts/home.html`, not `layouts/index.html`
5. [ ] See [[references/template-system.md]] for full lookup order

### Create render hooks (images, links)

1. [ ] Create `layouts/_markup/render-image.html` for images
2. [ ] Create `layouts/_markup/render-link.html` for external links
3. [ ] See [[references/render-hooks.md]] for ready-to-use templates

### Debug "missing content" or build errors

Follow the diagnostic chain in [[references/debugging.md]].

## References

- [[references/template-system.md]] - Template lookup order, base templates, v0.146+ changes
- [[references/asset-pipeline.md]] - Hugo Pipes: SCSS, JS, images, fingerprinting
- [[references/render-hooks.md]] - Responsive images and external link patterns
- [[references/debugging.md]] - Diagnostic chain for common symptoms
- [[references/hugo-module-config.md]] - Module config patterns and `hugo.toml` examples
