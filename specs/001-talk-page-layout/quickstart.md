# Quickstart: Managing Talk Pages

## Adding a New Talk
1. Create a new directory in `content/talks/YYYY-event-name/`.
2. Place a cover image (e.g., `cover.jpg`) in that directory.
3. Create `index.en.md` and `index.it.md`.
4. Use the following frontmatter:
```yaml
---
title: "Talk Title"
date: YYYY-MM-DD
image: cover.jpg
categories:
    - talks
tags:
    - Topic
---
Talk description here.
[![Thumbnail](thumbnail.png)](https://link-to-resource.com)
```

## Styling Adjustments
The `assets/css/custom.css` file contains rules to ensure images in talks behave as thumbnails.

## Local Preview
Run `hugo server -D` and navigate to `/talks/`.
