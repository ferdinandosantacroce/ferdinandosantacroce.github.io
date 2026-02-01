# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal blog built with Jekyll using the Minimal Mistakes theme. The site is hosted on GitHub Pages and available at https://jesuswasrasta.com.

**Theme**: Minimal Mistakes Jekyll Theme (remote theme from mmistakes/minimal-mistakes@4.24.0)
**Site Owner**: Ferdinando Santacroce
**Repository**: jesuswasrasta/jesuswasrasta.github.io

## Development Commands

### Local Development

#### Native Jekyll
```bash
# Install dependencies
bundle install

# Serve locally for development
bundle exec jekyll serve

# Serve with incremental builds (reloads _config.yml changes)
bundle exec jekyll serve --incremental
```

#### Docker (Recommended)
```bash
# Build and start the container
docker-compose up --build

# Run in detached mode
docker-compose up -d --build

# Stop the container
docker-compose down

# Rebuild after dependency changes
docker-compose build --no-cache
```

The site will be available at http://localhost:4000

### JavaScript Build Process
```bash
# Build and minify JavaScript
npm run build:js

# Watch for JS changes and rebuild
npm run watch:js
```

## Project Structure

- `_config.yml` - Main Jekyll configuration file with site settings, theme configuration, and plugins
- `_posts/` - Blog posts in Markdown format
- `_pages/` - Static pages
- `_resources/` - Custom collection for resource pages
- `_layouts/` - Custom page layouts (extends theme layouts)
- `_includes/` - Reusable template components
- `_sass/` - Custom Sass/SCSS styles
- `assets/` - Images, JavaScript, and other static assets
- `Gemfile` - Ruby gem dependencies

## Key Configuration

### Jekyll Plugins
The site uses these key Jekyll plugins (defined in `_config.yml`):
- jekyll-paginate
- jekyll-sitemap
- jekyll-gist
- jekyll-feed
- jekyll-include-cache
- jekyll-github-metadata
- jemoji
- jekyll/mastodon_webfinger

### Content Types
- **Posts**: Blog articles in `_posts/` with front matter
- **Pages**: Static pages in `_pages/`
- **Resources**: Custom collection in `_resources/` for resource pages

### Site Features
- Disqus comments integration
- Google Analytics tracking
- Social media integration (Mastodon, LinkedIn, GitHub)
- Search functionality
- Responsive design with multiple color schemes

## Dependencies

### Ruby Dependencies (Gemfile)
- github-pages (for GitHub Pages compatibility)
- jekyll-include-cache
- jekyll-mastodon_webfinger
- Various Jekyll plugins

### Node.js Dependencies (package.json)
- Used for JavaScript build process
- uglify-js for minification
- onchange for file watching

## Common Issues & Solutions

### Bundle Install Issues
If `bundle install` fails due to nokogiri dependency:
```bash
sudo apt-get install gcc ruby-dev libxslt-dev libxml2-dev zlib1g-dev
```

### Jekyll Serve Issues
Always use `bundle exec jekyll serve` instead of `jekyll serve` to avoid gem version conflicts.

### Docker Notes
- Uses `ruby:3.1-alpine` base image for minimal size and fast startup
- File watching may not work perfectly on Windows due to platform limitations
- Use `docker-compose exec jekyll bash` to access the container for manual operations
- Named volumes cache dependencies for faster rebuilds
- Single docker-compose.yml file is sufficient (already Alpine-based for optimal performance)

## Content Guidelines

- Posts use Markdown with Kramdown processor
- Emoji support via jemoji plugin (use :emoji: syntax)
- Font Awesome icons supported
- Support for YouTube/Vimeo video embeds in Markdown