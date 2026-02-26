# Template System (Hugo v0.146+)

## Key Changes in v0.146+

- `layouts/home.html` targets the homepage. `layouts/index.html` is now a **Single Page** template in the Unified Lookup Order — do not use it for the homepage.
- Base templates use dot-notation: `baseof.list.html`, not `list-baseof.html`.
- `layouts/all.html` acts as a global fallback when `_default/baseof.html` is too specific.

## Unified Lookup Order (simplified)

Hugo resolves templates in this priority order:

1. `layouts/<type>/<kind>.html` (most specific)
2. `layouts/<section>/<kind>.html`
3. `layouts/_default/<kind>.html`
4. `layouts/all.html` (global fallback)

For the homepage specifically: `layouts/home.html` → `layouts/_default/home.html`.

## Base Templates

Define a base layout with `{{ block "main" . }}{{ end }}`:

```go-html-template
{{/* layouts/_default/baseof.html */}}
<!DOCTYPE html>
<html>
  <head>{{ partial "head.html" . }}</head>
  <body>
    {{ block "main" . }}{{ end }}
  </body>
</html>
```

Override in specific templates with `{{ define "main" }}`:

```go-html-template
{{/* layouts/home.html */}}
{{ define "main" }}
  <h1>{{ .Title }}</h1>
  {{ .Content }}
{{ end }}
```

## Nested Layouts

Prefer specific layouts over `_default` when sections need different treatment:

- `layouts/blog/single.html` for blog posts
- `layouts/docs/list.html` for documentation sections

## Common Mistakes

| Mistake | Fix |
|---|---|
| `layouts/index.html` for homepage | Rename to `layouts/home.html` |
| `list-baseof.html` | Rename to `baseof.list.html` |
| Relying on `_default/single.html` for all types | Create section-specific templates |
