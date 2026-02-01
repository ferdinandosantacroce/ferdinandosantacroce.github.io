# Data Model: Hugo Content Bundles

## Entities

### Post / Talk Bundle (Leaf Bundle)
Represents an individual blog post or a specific talk entry.

| Field | Type | Description |
|-------|------|-------------|
| `title` | String | The display title of the content. |
| `description` | String | A short summary for list views and SEO. |
| `slug` | String | URL-friendly identifier. |
| `date` | Date | Publication or presentation date (ISO 8601). |
| `image` | String | Primary image file name (relative to bundle). |
| `categories` | Array | Categories (mapped from Jekyll, usually "Software"). |
| `tags` | Array | Relevant technical keywords. |

**Relationships**:
- Belongs to `talks` or `post` sections.
- Contains local image assets.

### Resources Index (Branch Bundle)
The container for thematic resource lists.

| Field | Type | Description |
|-------|------|-------------|
| `title` | String | "Resources" or "Risorse". |
| `description` | String | Introduction to the section. |
| `slug` | String | "resources" or "risorse". |

**Relationships**:
- Parent of individual resource leaf bundles (OOP, TDD).