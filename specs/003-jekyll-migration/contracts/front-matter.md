# Contract: Front Matter Schema

Every migrated file MUST comply with this YAML front matter structure to ensure compatibility with the Stack theme.

```yaml
---
title: "Content Title"
description: "Short summary for teaser"
slug: "clean-slug"
date: YYYY-MM-DD 00:00:00+0000
image: cover.jpg # if present in bundle
categories:
    - Software
tags:
    - tag1
    - tag2
---
```

## Validation Rules:
1. **Title**: Mandatory.
2. **Slug**: MUST be lowercase and hyphenated.
3. **Date**: MUST preserve original Jekyll date.
4. **Categories**: Jekyll "Posts" MUST be mapped to "Software".
5. **Parity**: Both `index.en.md` and `index.it.md` MUST be present in the bundle.
