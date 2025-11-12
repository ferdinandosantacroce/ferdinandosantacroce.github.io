# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is Ferdinando Santacroce's personal blog website built with Hugo static site generator using the Stack theme. The site is bilingual (English/Italian) and focuses on software development, agile coaching, and technical leadership content.

## Common Development Commands

### Local Development
```bash
hugo server
```
Starts the Hugo development server with live reload.

### Building for Production
```bash
hugo --minify --gc
```
Builds the site for production with minification and garbage collection.

### Theme Management
```bash
hugo mod get -u github.com/CaiJimmy/hugo-theme-stack/v3
hugo mod tidy
```
Updates the theme to the latest version and cleans up modules.

## Architecture and Structure

### Configuration
- **Multi-file config**: Configuration is split across multiple TOML files in `config/_default/`
- **Bilingual setup**: English (default) and Italian content with language-specific menus and parameters
- **Theme**: Uses Hugo Stack theme v3 as a Go module

### Content Organization
- **Posts**: Located in `content/post/` with multilingual support using filename suffixes (`.en.md`, `.it.md`)
- **Pages**: Static pages in `content/page/` (about, works, talks, resources)
- **Multilingual strategy**: Translation by filename with English as default language

### Key Directories
- `content/`: All site content (posts, pages)
- `config/_default/`: Split configuration files
- `assets/`: Custom CSS, icons, and images
- `static/`: Static files served directly (favicon, etc.)
- `public/`: Generated site output (ignored in git)

### Theme Customization
- Custom CSS in `assets/css/custom.css`
- Custom icons in `assets/icons/` (use Tabler icons format)
- Avatar and images in `assets/img/`

## Deployment

The site auto-deploys to GitHub Pages via GitHub Actions (`.github/workflows/deploy.yml`):
- **Trigger**: Push to `main` branch (also runs on PRs)
- **Build**: Hugo extended (latest) with Go 1.17+ on Ubuntu, using `hugo --minify --gc`
- **Deploy**: To `gh-pages` branch using JamesIves/github-pages-deploy-action@v4
- **Caching**: Hugo resources cached to speed up builds
- **Options**: Single commit deployment with clean flag enabled

## Content Guidelines

### Blog Posts
- Use multilingual file naming: `index.en.md` and `index.it.md`
- Include frontmatter with title, date, cover image, and categories
- Place post-specific images in the same directory as the post

### Hierarchical Content (Talks, Resources)
- Use `_index.en.md` and `_index.it.md` for section landing pages
- Create year-based subdirectories for organization (e.g., `content/page/talks/2023/`)
- Each year directory needs its own `_index.en.md` and `_index.it.md`
- Individual talks/resources can be markdown files or subdirectories with `index.en.md` and `index.it.md`

### Icons
- Download SVG icons from tablericons.com
- Place in `assets/icons/` with specific attributes: `width="24" height="24" stroke-width="2" stroke="currentColor"`
- Reference in page frontmatter using `icon` parameter

### Images
- Use high-quality images (they are automatically resized)
- Cover images should be named `cover.jpg` or referenced via `/images/` path
- Post-specific images go in the post directory
- Shared images go in `assets/img/` or `static/images/`

## Development Notes

- Hugo extended version required for SCSS processing
- Go 1.17+ required for theme modules
- Site builds to `public/` directory
- Theme is loaded as Hugo module, not as git submodule

## Important File Patterns

### Multilingual Content Creation
When creating new content, always create both language versions:
- English: `index.en.md` (or use `.en.md` suffix)
- Italian: `index.it.md` (or use `.it.md` suffix)
- Files without language suffix default to English
- Use `_index.en.md` / `_index.it.md` for section/list pages (parent directories)
- Use `index.en.md` / `index.it.md` for individual pages within their own directory

### Frontmatter Requirements
All content files require proper frontmatter structure. Key fields:
- `title`: Page/post title
- `date`: Publication date (format: YYYY-MM-DDTHH:MM:SS+TZ)
- `slug`: URL slug for the page
- `menu`: For pages in main navigation
- `icon`: For pages with custom icons (reference files in `assets/icons/`)
- `cover`: For posts with cover images

### Configuration Structure
The site uses split configuration files in `config/_default/`:
- `config.toml`: Main site settings, base URL, language configuration, pagination
- `menu.toml`: Navigation menu structure (language-specific)
- `params.toml`: Theme parameters and customizations
- `module.toml`: Hugo module configuration (imports hugo-theme-stack/v3)
- `markup.toml`: Markdown rendering configuration
- `permalinks.toml`: URL structure configuration
- `related.toml`: Related content configuration
- `_languages.toml`: Additional language-specific settings

### Asset Configuration
- `assets/jsconfig.json`: Configuration for asset processing and IntelliSense
- Custom CSS loaded via `config.toml`: `params.assets.customCSS = ["css/custom.css"]`