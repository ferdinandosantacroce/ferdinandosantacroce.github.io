# ferdinandosantacroce.it

Source of the personal site of Ferdinando Santacroce: a blog, an archive of talks and books, and over time the professional hub that collects his career, projects and services.

Built with [Hugo](https://gohugo.io/) and the [Stack](https://github.com/CaiJimmy/hugo-theme-stack) theme, loaded as a Hugo Module. Bilingual English and Italian. Deployed to GitHub Pages.

## Stack

| Piece | Version | Pinned in |
| --- | --- | --- |
| Hugo extended | `0.165.0` | `.mise.toml`, GitHub Actions |
| Go | `1.27.x` | `go.mod`, GitHub Actions |
| Stack theme | `v4.x` | `config/_default/module.toml`, `go.mod` |

There is no Node build step. Styles and scripts come from the theme; the only custom stylesheet is `assets/css/custom.css`.

## Local development

```bash
mise install          # installs Hugo extended 0.165.0
hugo server -D        # dev server with drafts at http://localhost:1313/
hugo --minify --gc    # production build, the same command CI runs
```

## Repository map

```text
config/_default/      Hugo configuration, one file per concern
content/
  post/<slug>/        articles, one leaf bundle each     -> /p/<slug>/
  talks/<slug>/       one bundle per talk                -> /talks/
  works/<slug>/       books and articles                 -> /works/
  page/<name>/        about, archives, search
  page/resources/     branch bundle with oop/ and tdd/
assets/
  css/custom.css      the only custom stylesheet
  icons/              Tabler icons used by the menu
  img/                site images such as avatar and favicon
layouts/              overrides for specific list layouts
raw/                  source material for republication, never published
docs/                 internal documentation, never published
specs/                archived feature specs
static/               files served as they are (CNAME)
```

## Content rules

- **Every bundle carries two files**, `index.en.md` and `index.it.md`. Files without a language suffix default to English; Italian pages live under `/it/`.
- Images sit inside the bundle next to the Markdown file and are referenced by their relative name, for example `![caption](cover.jpg)`.
- Posts use `title`, `description`, `slug`, `date`, `image`, `categories`, `tags`. Republications may add `series`, `part`, `source` and `source_date`.
- Works add `group: book` or `group: article`, plus `weight` to order them inside the group.
- Talks add `params.video` when a recording exists.
- Pages may set `slug`, and a localized `url` when the Italian address should be Italian too.
- Full field reference: [docs/contenuti/front-matter.md](docs/contenuti/front-matter.md).

Minimal post front matter:

```yaml
---
title: "Post Title"
description: "One line that explains what the reader gets"
slug: post-slug
date: 2026-10-20
image: cover.jpg
categories:
    - Software
tags:
    - refactoring
---
```

## Bilingual policy

Strict parity, defined in [docs/piano-evoluzione-blog.md](docs/piano-evoluzione-blog.md#21-cosa-significa-parità-stretta-definizione-operativa):

1. every bundle has both language files from the first commit;
2. one language may be published while the other is still `draft: true`;
3. the translation debt is listed and visible, never silent.

Italian is the primary language. English translations may land later, but they always land.

## Publishing

**Publication is currently on hold.** The site is being rebuilt, so every commit ends with `[ci skip]` and pushes never deploy.

- The deploy workflow runs on push to `main` only. Pull requests build the site and stop there.
- To publish, push a head commit without the marker:

```bash
git commit --allow-empty -m "chore: publish"
git push
```

- The theme updates itself weekly, gated by a build, and never publishes on its own.
- Never deploy by hand, never commit `public/` or `resources/`.

## Documentation

| File | Content |
| --- | --- |
| [docs/piano-evoluzione-blog.md](docs/piano-evoluzione-blog.md) | medium and long term plan, with numbered tasks and state |
| [docs/contenuti/front-matter.md](docs/contenuti/front-matter.md) | front matter schema for every content type |
| [docs/contenuti/mappatura-mokabyte.md](docs/contenuti/mappatura-mokabyte.md) | the 13 MokaByte articles to republish, with slugs and decisions |
| [docs/piano-editoriale/](docs/piano-editoriale/) | editorial plan, article ideas, voice notes register |
| [docs/workflow-feedback.md](docs/workflow-feedback.md) | friction observed while working, candidates for skills and agents |
| [specs/](specs/) | archived feature specs, kept as history |

## License

The site code, meaning templates, configuration, CSS, scripts and workflows, is licensed under the MIT License. All prose, articles and media in `content/` are licensed under Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0).

See [LICENSE](LICENSE) for the code and [CONTENT-LICENSE.md](CONTENT-LICENSE.md) for the content.
