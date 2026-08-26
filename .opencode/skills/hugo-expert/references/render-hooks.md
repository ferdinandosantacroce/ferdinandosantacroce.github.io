# Render Hooks

Use render hooks instead of shortcodes for basic HTML elements (images, links). This keeps Markdown portable and avoids polluting content with Hugo-specific syntax.

## Responsive Image Hook

Generates `srcset` automatically for local images with WebP output. Falls back gracefully for remote images.

**File:** `layouts/_markup/render-image.html`

```go-html-template
{{- $u := urls.Parse .Destination -}}
{{- $img := .Page.Resources.GetMatch $u.Path -}}
{{- if and $img (not $u.IsAbs) -}}
  {{- $small := $img.Resize "480x webp" -}}
  {{- $large := $img.Resize "1200x webp" -}}
  <figure>
    <img src="{{ $large.RelPermalink }}"
         srcset="{{ $small.RelPermalink }} 480w, {{ $large.RelPermalink }} 1200w"
         sizes="(min-width: 1024px) 1200px, 100vw"
         alt="{{ .Text }}" loading="lazy" decoding="async">
    {{- with .Title }}<figcaption>{{ . }}</figcaption>{{ end -}}
  </figure>
{{- else -}}
  <img src="{{ .Destination | safeURL }}" alt="{{ .Text }}" loading="lazy">
{{- end -}}
```

Requires images as [Page Resources](https://gohugo.io/content-management/page-resources/) (i.e., in a Leaf Bundle alongside the `index.md`).

## External Link Hook

Adds `target="_blank" rel="noopener noreferrer"` to external links automatically.

**File:** `layouts/_markup/render-link.html`

```go-html-template
{{- $isExternal := or (strings.HasPrefix .Destination "http") (strings.HasPrefix .Destination "//") -}}
<a href="{{ .Destination | safeURL }}"
   {{ if $isExternal }}target="_blank" rel="noopener noreferrer"{{ end }}
   {{ with .Title }}title="{{ . }}"{{ end }}>
  {{ .Text | safeHTML }}
</a>
```

## When to Use Shortcodes Instead

Use shortcodes when you need Hugo-specific features that have no Markdown equivalent: YouTube embeds, custom callout boxes, tabbed content, etc.
