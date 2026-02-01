# Research: Jekyll to Hugo Migration Details

## Decision: Unpacking Talks
**Rationale**: Converting the monolithic Jekyll talks list into individual Hugo leaf bundles allows for better metadata handling, independent page URLs, and alignment with the current site architecture.
**Alternatives considered**: Keeping a single talks page. Rejected because it breaks the pattern used for other talks and limits future features (e.g., individual talk social sharing).

## Decision: Resources as Branch Bundle
**Rationale**: "Resources" is a collection of distinct topics (OOP, TDD). A branch bundle allows for a landing page that introduces the section while providing clean URLs for sub-topics.
**Alternatives considered**: Merging into one page. Rejected because the topics are conceptually separate and have significant content volume.

## Decision: New Slugs for Hugo
**Rationale**: Jekyll permalinks were complex (`/:categories/:title/`). Hugo will use cleaner, simpler slugs (`/post/[slug]/`).
**Alternatives considered**: Maintaining aliases for SEO. User explicitly requested using only new slugs (Opance B in clarification).

## Mapping Table: Content & Assets

| Content Item | Source File (Jekyll) | Target Folder (Hugo) | Key Assets |
|--------------|----------------------|----------------------|------------|
| Blog Post | `_archive/2019-8-14-git-essentials-on-book-authority.md` | `content/post/git-essentials-on-book-authority/` | None |
| Talk 2023 (IAD) | `_pages/talks.md` (Entry) | `content/talks/2023-iad-modelli-realta/` | `Modelli-Realta-IAD-2023.png` |
| Talk 2023 (Podcast) | `_pages/talks.md` (Entry) | `content/talks/2023-reloaded-podcast-story-points/` | `agile-reloaded-podcast.jpg` |
| Talk 2022 (IAD) | `_pages/talks.md` (Entry) | `content/talks/2022-iad-carbone-software/` | `Dal-carbone-al-software-i-sistemi socio-tecnici-IAD22.png` |
| Page: Works | `_pages/works.md` | `content/page/works/` | `git-essentials-1st-edition-small.png`, `git-essentials-2nd-edition-small.png`, `cover-git-apogeo.jpg` |
| Page: Resources (OOP) | `_resources/oop.md` | `content/page/resources/oop/` | None |
| Page: Resources (TDD) | `_resources/tdd.md` | `content/page/resources/tdd/` | None |

## Best Practices
- **Bilingual Parity**: For every migration, create `index.it.md` and translate to `index.en.md` immediately.
- **Asset Co-location**: Place images directly inside the post/talk folder to leverage Hugo leaf bundles.
- **Front Matter**: Use YAML format compatible with Hugo Theme Stack v3 (title, date, slug, image, categories, tags).