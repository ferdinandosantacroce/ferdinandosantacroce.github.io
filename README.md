# Ferdinando Santacroce Blog

Personal blog built with Hugo using the Stack theme. Features bilingual content (English/Italian) focusing on software development, agile coaching, and technical leadership.

## Development

### Local Development
```bash
hugo server
```

### Building for Production
```bash
hugo --minify --gc
```

## Project Structure

- **Content**: Bilingual posts and pages in `content/` using filename suffixes (`.en.md`, `.it.md`)
- **Configuration**: Split across multiple files in `config/_default/`
- **Theme**: Hugo Stack theme loaded as Go module
- **Assets**: Custom CSS, icons, and images in `assets/`
- **Static**: Static files in `static/` (favicon, etc.)

## Deployment

Auto-deploys to GitHub Pages via GitHub Actions on push to `main` branch.

---

## Tips and Tricks

### Theme Management

Update theme manually:
```bash
hugo mod get -u github.com/CaiJimmy/hugo-theme-stack/v3
hugo mod tidy
```

> This template uses `v3` of the theme. For `v4` or higher, manually update `config/module.toml`.

### Icons

Download icons from [tablericons.com](https://tablericons.com/) and save to `assets/icons/`.
Ensure these SVG properties:
```svg
width="24" height="24"
stroke-width="2"
stroke="currentColor"
```

To change sidebar menu icons, edit the page's frontmatter:
```markdown
---
title: "Works"
menu:
    main:
        params:
            icon: brain
---
```

### Images

Use high-quality images - they are automatically resized during build.

### Content Management

- Content in `content/` gets published
- Use [translation by filename](https://gohugo.io/content-management/multilingual/#translation-by-file-name) strategy
- Files without language suffix default to English

### Alternative Hosting

For platforms like Vercel, ensure Go is installed:
```bash
amazon-linux-extras install golang1.11 && hugo --gc --minify
```

Set `HUGO_VERSION` environment variable to the latest Hugo extended version.

### Further Learning

- [Hugo templates documentation](https://gohugo.io/templates/lists/)
- [Multilingual mode guide](https://gohugo.io/content-management/multilingual/)