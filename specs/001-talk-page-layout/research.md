# Research: Talk Page Layout and Image Handling

## Decision 1: Header/Cover Image Implementation
**Chosen**: Use frontmatter `image` parameter with Hugo Page Bundles.
**Rationale**: The Stack theme automatically uses the `image` parameter in the frontmatter as a featured image on single post pages. This satisfies the "immagine di copertina" requirement without modifying theme layouts.
**Alternatives Considered**: Custom layout override. Rejected as it violates "Theme Integrity" principle when a native solution exists.

## Decision 2: Clickable Thumbnails in Body
**Chosen**: Standard Markdown for linked images + Custom CSS for sizing.
**Rationale**: Using `[![alt](image)](url)` is the most portable and simple way. By adding a CSS rule in `assets/css/custom.css` targeting images within the talk section, we can force them to behave like thumbnails (e.g., `max-width: 300px`) without requiring complex shortcodes for every entry.
**Alternatives Considered**: Hugo `figure` shortcode. Rejected because it's more verbose for the user to type and may require more manual work for 27 existing talks.

## Decision 3: Layout and Sidebar
**Chosen**: Maintain standard theme article layout.
**Rationale**: Ensures visual consistency with blog posts and respects the user's preference for a cohesive site experience.
**Alternatives Considered**: Full-width layout. Rejected because it would require a custom layout override, which we want to avoid for "Theme Integrity".
