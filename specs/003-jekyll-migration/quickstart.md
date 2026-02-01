# Quickstart: Content Migration Workflow

Follow these steps to migrate a single content item (post, talk, or page).

## 1. Create the Bundle
```bash
mkdir -p content/[post|talks|page]/[slug]
```

## 2. Initialize Language Files
Create `index.it.md` (source content) and `index.en.md` (translated content).

## 3. Apply Front Matter
Ensure the front matter follows the contract in `contracts/front-matter.md`.
Example for Italian:
```yaml
---
title: "Il mio Talk"
slug: "mio-talk"
date: 2023-10-25 00:00:00+0000
categories:
    - Software
---
```

## 4. Migrate Assets
Identify and copy images from `jesuswasrasta.github.io/assets/images/` to the bundle folder. Update references in Markdown to use relative paths (e.g., `image.png` instead of `/assets/images/image.png`).

## 5. Local Verification
Run Hugo and check both URLs:
```bash
hugo server -D
```
- IT: `http://localhost:1313/it/[path]/[slug]/`
- EN: `http://localhost:1313/[path]/[slug]/`