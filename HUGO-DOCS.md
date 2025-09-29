# hugo blog engine how to structure a blog with section and subsections nested in

To structure a Hugo blog with sections and nested subsections, organize the `content` directory using subfolders with `_index.md` files for each section and subsection. Hugo treats any folder with an `_index.md` file as a section and automatically generates URLs and list pages that mirror this hierarchy, while also allowing for customization in templates and navigation.[^1][^2][^3]

### Basic Directory Structure

A common directory tree might look like:

```
content/
  blog/
    _index.md        # Main blog section (list page)
    2025/
      _index.md      # Year section
      topic1/
        _index.md    # Topic subsection
        post-1.md
        post-2.md
      topic2/
        post-3.md
    2024/
      topic3/
        post-4.md
  about/
    _index.md
```

- Each folder with an `_index.md` is a section or subsection (e.g., `/blog/`, `/blog/2025/`, `/blog/2025/topic1/`).
- Regular Markdown files (e.g., `post-1.md`) inside these folders are leaf pages/posts.[^2][^3]


### Templates and Section Indexes

- Hugo uses list templates for `_index.md` files and single templates for regular `.md` files.

```
- To use different templates for particular subsections, specify `type` or `layout` in the front matter of `_index.md` or post files and create the corresponding files under `layouts/<type>/section.html` or `layouts/<type>/single.html`.[^4][^1]
```


### Rendering Nested Navigation

- Hugo will automatically generate section index URLs (e.g., `/blog/2025/`, `/blog/2025/topic1/`).
- For listing posts or pages within nested sections, use Hugo functions like `.Pages` or `.RegularPagesRecursive` in your list templates.
- Customize navigation by iterating over sections and subsections, or by building menus manually in `config.toml`.[^5][^1]


### Notes and Best Practices

- Always use `_index.md` (not `index.md`) for section list pages, so folders are recognized as sections with children.[^2]
- You can nest sections as deeply as needed; Hugo handles the URLs and structure automatically.[^3]
- Customize navigation and sidebar using Hugo's menu and partial system if deeply nested navigation is required.[^5]

This structure allows for deep organization—ideal for multi-level topics, series, or multi-layered blogs while maintaining clean navigation in Hugo.[^1][^3][^2][^5]

## Practical Experience: Restructuring a Talks Section

Based on restructuring a monolithic talks page into properly organized Hugo sections, here are key lessons learned:

### Section Structure for Year-Based Organization

**Working Structure Used:**
```
content/page/talks/
  _index.en.md         # Main talks section (English)
  _index.it.md         # Main talks section (Italian)
  2016/
    _index.en.md       # Year section index
    _index.it.md       # Year section index
    talk-name.en.md    # Individual talk pages
    talk-name.it.md    # Individual talk pages
  2017/
    _index.en.md
    _index.it.md
    talk-name.en.md
    talk-name.it.md
```

### Critical Learnings

**1. Section vs Page Bundle Distinction**
- **Sections** use `_index.md` files and create list pages that automatically include child content
- **Page bundles** use `index.md` files and are self-contained (no children)
- **Key mistake avoided:** Initially tried nested page bundles (`index.md` inside folders with `index.md`) which Hugo doesn't support
- **Solution:** Use sections (`_index.md`) for any folder that needs to contain other content

**2. Multilingual Content Organization**
- Use filename suffixes: `.en.md` and `.it.md` for each piece of content
- Both section indexes and individual pages need language variants
- Hugo automatically handles language switching and URL structure

**3. Image Handling Best Practices**
- **Static directory approach:** Place shared images in `/static/images/talks/`
- **Reference in content:** Use `/images/talks/filename.png` (absolute paths from site root)
- **Advantages:** Images are shared across all content, single source of truth
- **Alternative:** Page bundles with local images (but doesn't work well with sections)

**4. Frontmatter Patterns for Consistency**
```yaml
---
title: "Event Name"
description: "Talk topic"
date: 2020-03-15T00:00:00+01:00
categories: ["conference", "topic"]
image: /images/talks/image-name.png
---
```

**5. Automatic Table of Contents Generation**
- Section index files with `toc: true` in frontmatter automatically list child pages
- Hugo's Stack theme (and many others) generate beautiful organized lists
- No manual maintenance needed - content appears automatically when added

**6. URL Structure Benefits**
- Clean, semantic URLs: `/talks/2020/event-name/`
- SEO-friendly organization
- Easy navigation and breadcrumbs
- Automatic section pages at `/talks/2020/` level

### Migration Strategy That Worked

1. **Create section structure first** - Set up `_index.md` files for all years
2. **Extract content systematically** - Process one year at a time from old monolithic files
3. **Maintain consistency** - Use identical frontmatter patterns and naming conventions
4. **Leverage automation** - Hugo's automatic content listing eliminates manual index maintenance

### Common Pitfalls Avoided

- **Don't mix page bundles and sections** - Pick one approach and stick to it
- **Don't forget language variants** - Every piece of content needs both `.en.md` and `.it.md`
- **Don't use relative image paths** - Static directory with absolute paths is more reliable
- **Don't manually maintain lists** - Let Hugo's `toc: true` handle content listing automatically

This approach successfully converted 50+ individual talks across 8 years from a monolithic structure into a well-organized, maintainable Hugo section hierarchy with automatic navigation and bilingual support.

<span style="display:none">[^10][^11][^12][^13][^14][^15][^16][^17][^18][^19][^20][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://gohugo.io/content-management/sections/

[^2]: https://cloudcannon.com/blog/the-ultimate-guide-to-hugo-sections/

[^3]: https://hugo-in-action.foofun.cn/docs/part1/chapter4/2/

[^4]: https://stackoverflow.com/questions/56218412/how-to-create-three-step-nesting-using-hugo

[^5]: https://staticmania.com/blog/hugo-nested-navigation

[^6]: https://discourse.gohugo.io/t/creating-a-layout-for-content-with-multiple-subfolders/45618

[^7]: https://www.jakewiesler.com/blog/hugo-directory-structure

[^8]: https://discourse.gohugo.io/t/need-help-in-creating-multiple-blog-sections/27661

[^9]: https://moonbooth.com/hugo/sections/

[^10]: https://www.giraffeacademy.com/static-site-generators/hugo/content-organization/

[^11]: https://discourse.gohugo.io/t/multiple-blogs-in-a-single-domain/5977

[^12]: https://www.reddit.com/r/gohugo/comments/htpwya/best_practice_for_content_subfolders/

[^13]: https://www.hannaliebl.com/blog/nesting-taxonomies-in-hugo/

[^14]: https://www.docsy.dev/docs/adding-content/content/

[^15]: https://discourse.gohugo.io/t/get-a-list-page-in-a-nested-section-consisting-of-tags-from-the-blog-section/47748

[^16]: https://river.me/organize-your-hugo-content-folder-by-year-without-affecting-any-urls/

[^17]: https://stackoverflow.com/questions/69634076/nested-list-of-sections-and-content-hugo

[^18]: https://stackoverflow.com/questions/75712280/how-to-list-sub-folder-of-section-on-hugo

[^19]: https://gohugobrasil.netlify.app/content-management/organization/

[^20]: https://github.com/gohugoio/hugo/issues/12188

