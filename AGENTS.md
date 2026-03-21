# AGENTS.md - Project Context & Commands

This is the personal blog of Ferdinando Santacroce, built with Hugo using the Stack theme v3. Bilingual site (English/Italian) deployed to GitHub Pages at `ferdinandosantacroce.it`.

## Core Principles (The Constitution)

1.  **Bilingual Content Parity**: Every piece of content MUST exist in both English (`index.en.md`) and Italian (`index.it.md`). No placeholders allowed.
2.  **Content-First Structure**: Strict adherence to Hugo conventions. Posts in `content/post/[slug]/`, pages in `content/page/[name]/`.
3.  **Theme Integrity**: Do not modify theme files directly. Use `assets/css/custom.css` for overrides. Updates are managed via Hugo modules.
4.  **Automated Deployment**: GitHub Actions is the only deployment path to `main`. No manual deployments.
5.  **Simplicity & Focus**: Professional content (Software, Agile, Coaching). No unnecessary JS, no comments system, focus on performance.

## Development Commands

```bash
# Local development server (includes drafts)
hugo server -D

# Production build
hugo --minify --gc

# Update theme manually
hugo mod get -u github.com/CaiJimmy/hugo-theme-stack/v3
hugo mod tidy
```

## Architecture

### Configuration Structure

All Hugo configuration lives in `config/_default/`:
- `config.toml` - Base URL, languages (en/it), pagination
- `params.toml` - Theme parameters, sidebar widgets, footer
- `menu.toml` - Social links (email, LinkedIn, GitHub, Mastodon)
- `module.toml` - Theme import via Hugo modules
- `permalinks.toml` - URL patterns: posts at `/p/:slug/`, pages at `/:slug/`

### Content Organization

```
content/
├── post/           # Blog posts (use index.en.md / index.it.md for bilingual)
├── page/           # Static pages: about, talks, works, resources, archives, search
└── categories/     # Category definitions
```

**Multilingual strategy**: Translation by file name suffix (`.en.md`, `.it.md`). Files without suffix default to English.

### Assets

- `assets/css/custom.css` - Custom CSS (currently emoji font family, and other project-specific styling)
- `assets/icons/` - SVG icons from Tabler Icons (must have `width="24" height="24" stroke-width="2" stroke="currentColor"`)
- `assets/img/` - Images (auto-resized on build)

### Deployment

GitHub Actions workflow (`.github/workflows/deploy.yml`) automatically deploys to `gh-pages` branch on push to `main`. Theme updates run daily via `.github/workflows/update-theme.yml`. There's also `001-update-hugo` in recent changes which implies Hugo version updates are handled via GitHub Actions.

## Creating Content

### New Post

Create folder `content/post/my-post/` with:
- `index.en.md` - English version
- `index.it.md` - Italian version
- `cover.jpg` - Cover image (optional)

Front matter example:
```yaml
---
title: "Post Title"
date: 2024-01-15
categories: [Software]
tags: [tag1, tag2]
image: cover.jpg
---
```

### Adding Icons

1. Download SVG from https://tablericons.com/
2. Save to `assets/icons/`
3. Edit SVG attributes: `width="24" height="24" stroke-width="2" stroke="currentColor"`
4. Reference in page front matter: `icon: icon-name`

## Testing

No formal automated test suite. Use `hugo server -D` to preview changes locally before committing. For deployment, changes are verified via GitHub Actions.

## Gotchas & Non-Obvious Patterns

- Always create both language versions when adding new content to maintain bilingual parity.
- Remove `draft: true` from front matter before publishing.
- Use absolute paths for file operations (starting with `/`).
- Theme updates are managed via Hugo modules, not direct file modifications.
- Images are automatically resized by Hugo during build.

## Active Technologies

- Hugo (latest compatible with Theme Stack v3)
- Go Modules (for Hugo theme management)
- GitHub Actions (CI/CD, using `peaceiris/actions-hugo@v2` and `actions/setup-go@v4`)
- Tabler Icons (SVG icons)
- YAML (GitHub Actions workflows)

## Open TODOs

- Italian date formatting for Italian language.
- Auto-linking articles across languages.

## Recent Changes

- Updated Hugo version in GitHub Actions (001-update-hugo).
- Migrated from Jekyll to Hugo (003-jekyll-migration).
- Further changes related to Hugo, Go Modules, and Stack Theme v3 integrations.
