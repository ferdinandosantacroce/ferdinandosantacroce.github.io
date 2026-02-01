# Ferdinando Santacroce's Blog

Personal blog built with Hugo and the Stack theme, deployed to [ferdinandosantacroce.it](https://ferdinandosantacroce.it).

## Quickstart

### Local development

```bash
# Start dev server (includes drafts)
hugo server -D

# Production build (same as CI)
hugo --minify --gc
```

The site runs at `http://localhost:1313/`.

### Creating a new post

1. Create a folder: `content/post/my-new-post/`
2. Add both language versions:
   - `index.en.md` (English)
   - `index.it.md` (Italian)
3. Add a cover image (optional): `cover.jpg`

**Front matter template:**

```yaml
---
title: "Post Title"
date: 2024-01-15
draft: true
categories: [Software]
tags: [tag1, tag2]
image: cover.jpg
---

Your content here...
```

4. Preview locally with `hugo server -D`
5. Remove `draft: true` when ready to publish
6. Commit and push; GitHub Actions deploys automatically

### Update theme

```bash
hugo mod get -u github.com/CaiJimmy/hugo-theme-stack/v3
hugo mod tidy
```

---

## Theme info

This blog uses [Hugo Theme Stack v3](https://github.com/CaiJimmy/hugo-theme-stack) loaded via Hugo modules.

- **Template source:** [hugo-theme-stack-starter](https://github.com/CaiJimmy/hugo-theme-stack-starter)
- **Configuration:** `config/_default/*.toml`
- **Deployment:** GitHub Actions on push to `main` (daily theme updates via cron)

---

## My notes

### Content structure

- Everything in `content/` folder gets published
- Example posts moved to `examples/` folder (not published)
- Posts: `content/post/[slug]/`
- Pages: `content/page/[name]/`

### Multilingual mode

I use the [translation by file name](https://gohugo.io/content-management/multilingual/#translation-by-file-name) strategy:

- `index.en.md` for English
- `index.it.md` for Italian
- Files without suffix default to English

### Icons

Icons come from [Tabler Icons](https://tablericons.com/). To add a new icon:

1. Download the SVG from tablericons.com
2. Save to `assets/icons/`
3. Edit the SVG attributes:

```svg
width="24" height="24"
stroke-width="2"
stroke="currentColor"
```

To change sidebar menu icons, edit the page's front matter:

```yaml
menu:
    main:
        weight: 2
        params:
            icon: brain
```

### Images

Use high quality images; Hugo resizes them automatically before publishing.

### Useful links

- [Hugo templates documentation](https://gohugo.io/templates/lists/)
- [Multilingual mode](https://gohugo.io/content-management/multilingual/)
- [Stack theme docs](https://stack.jimmycai.com/)

## License
The Hugo configuration and site code are licensed under the MIT License. All prose, articles, and media in the content/ directory are licensed under Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0).
See [LICENSE](LICENSE) for details. 