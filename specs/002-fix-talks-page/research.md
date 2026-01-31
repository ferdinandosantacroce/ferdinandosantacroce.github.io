# Research: Talks Page Standardization

## Problem Analysis

The `talks` page current state:
- **English**: Functional but messy Markdown (mixed HTML, inconsistent image usage).
- **Italian**: "Under construction", missing all content.
- **Formatting**: No clear pattern for talk entries, leading to visual clutter and inconsistent mobile rendering.

## Proposed Solution: Standardized Markdown Pattern

To avoid creating custom shortcodes (which would require a `layouts` directory we don't currently have), we will adopt a strict Markdown pattern for every talk entry. This ensures consistency and makes future automation easier.

### The "Talk Entry" Pattern

```markdown
### [Flag] [Event Name](Event URL)
[Talk Title](Talk URL)
[Brief description of the talk/workshop]

[![Thumbnail Alt](img/thumbnail.png)](Link to Video/Slides/etc)
*Caption describing the thumbnail*

- [Icon] [Resource Type (Video/Slides/Repo)](URL)
```

### Technical Implementation Details

1. **Images**: Use standard Markdown `![alt](path)` with relative paths to `img/`.
2. **Thumbnails**: Standardize on a few types:
   - Local PNG/JPG for Miro boards and slides.
   - YouTube thumbnail URL (`http://img.youtube.com/vi/[ID]/0.jpg`) for videos.
3. **Parity**: The Italian version will use the same structure, translating:
   - Talk titles (where applicable).
   - Event descriptions.
   - Resource types (e.g., "Video" -> "Video", "Slides" -> "Slide").
4. **Icons**: Use Emoji as simple, technology-agnostic icons (🇮🇹, 🇬🇧, 🎥, 📊, 💻).

## Constraints Check

- **Bilingual Parity**: Manual synchronization of content across `.en.md` and `.it.md`.
- **Mobile First**: Using standard Markdown ensures responsive behavior by default in the `hugo-theme-stack`.
- **Performance**: Standardizing thumbnails reduces layout shifts.
