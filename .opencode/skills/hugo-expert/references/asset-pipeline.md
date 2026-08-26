# Asset Pipeline (Hugo Pipes)

## Directory Roles

- `assets/` — files for processing (SCSS, JS, images). Target of Hugo Pipes.
- `static/` — files copied as-is (`robots.txt`, `CNAME`, favicons).

Never put processable assets in `static/`.

## SCSS/Sass

Assumes Dart Sass (embedded). Use `@use` and `@forward` — `@import` is deprecated.

Typical pipeline:

```go-html-template
{{ $scss := resources.Get "css/main.scss" }}
{{ $css := $scss | resources.ToCSS (dict "transpiler" "dartsass") }}
{{ if hugo.IsProduction }}
  {{ $css = $css | resources.Fingerprint }}
{{ end }}
<link rel="stylesheet" href="{{ $css.RelPermalink }}">
```

With PostCSS (e.g., Tailwind):

```go-html-template
{{ $css = $css | resources.PostCSS | resources.Fingerprint }}
```

## JavaScript

Use `js.Build` (ESBuild) — do not set up external Webpack/Gulp unless strictly necessary.

```go-html-template
{{ $js := resources.Get "js/main.js" | js.Build (dict "minify" hugo.IsProduction) }}
{{ if hugo.IsProduction }}
  {{ $js = $js | resources.Fingerprint }}
{{ end }}
<script src="{{ $js.RelPermalink }}"></script>
```

## Image Processing

Process images from page resources or `assets/`:

```go-html-template
{{ $img := .Page.Resources.GetMatch "cover.jpg" }}
{{ $resized := $img.Resize "800x webp" }}
<img src="{{ $resized.RelPermalink }}" width="{{ $resized.Width }}" height="{{ $resized.Height }}">
```

Common operations: `Resize`, `Fit`, `Fill`, `Crop`. Output formats: `webp`, `jpg`, `png`, `avif`.

## Fingerprinting (Cache-Busting)

Always fingerprint in production:

```go-html-template
{{ $asset = $asset | resources.Fingerprint "sha256" }}
```

Use `{{ $asset.Data.Integrity }}` for the SRI hash in `<link integrity="...">`.
