# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal blog of Ferdinando Santacroce built with Hugo using the Stack theme v3 (via Hugo modules). Bilingual site (English/Italian) deployed to GitHub Pages at `ferdinandosantacroce.it`.

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

- `assets/css/custom.css` - Custom CSS (currently emoji font family)
- `assets/icons/` - SVG icons from Tabler Icons (must have `width="24" height="24" stroke-width="2" stroke="currentColor"`)
- `assets/img/` - Images (auto-resized on build)

### Deployment

GitHub Actions workflow (`.github/workflows/deploy.yml`) automatically deploys to `gh-pages` branch on push to `main`. Theme updates run daily via `.github/workflows/update-theme.yml`.

## Creating Content

### New Post

Create folder `content/post/my-post/` with:
- `index.en.md` - English version
- `index.it.md` - Italian version
- `cover.jpg` - Cover image (optional)

Front matter:
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

## Open TODOs

- Italian date formatting for Italian language
- Auto-linking articles across languages

## Active Technologies
- YAML (GitHub Actions workflows) + peaceiris/actions-hugo@v2, actions/setup-go@v4 (001-update-hugo)

## Recent Changes
- 001-update-hugo: Added YAML (GitHub Actions workflows) + peaceiris/actions-hugo@v2, actions/setup-go@v4
