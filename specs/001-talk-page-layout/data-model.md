# Data Model: Talk Entity

## Entity: Talk
Represents a speaking engagement or public appearance.

### Fields
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `title` | string | Yes | The title of the talk/session. |
| `date` | date | Yes | The date of the event. |
| `description` | string | No | Short summary for list views and SEO. |
| `image` | string | Yes | Filename of the cover image (should be in the same folder). |
| `categories` | list | Yes | MUST include `talks`. |
| `tags` | list | No | Relevant topics (e.g., TDD, Agile). |
| `slug` | string | No | URL-friendly identifier. |

### Relationships
- Belongs to `talks` category.
- Stored as a **Page Bundle** directory in `content/talks/[slug]/`.

### Validation Rules
1. Every talk MUST have an English version (`index.en.md`) and an Italian version (`index.it.md`).
2. The `image` referenced in frontmatter MUST exist in the page bundle folder.
3. Images in the markdown body SHOULD be linked to external resources (Video, Slides, Meetup).
