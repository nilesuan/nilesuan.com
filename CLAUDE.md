# CLAUDE.md

## Project

Personal blog at nilesuan.com. Static site built with MkDocs + Tailwind CSS v4, dockerised for dev and deploy.

## Tech Stack

- **MkDocs** (Python) — static site generator
- **Tailwind CSS v4** with Typography plugin — styling
- **Docker** — only required local dependency

## Development

```sh
docker compose up --build
```

Site serves at http://localhost:8000. The entrypoint runs Tailwind in watch mode and MkDocs serve with a polling watcher that auto-rebuilds on changes to `theme/`, `docs/`, or `mkdocs.yml`.

## Directory Structure

- `docs/` — Markdown content (posts, homepage)
- `docs/blog/posts/` — Blog posts
- `docs/css/output.css` — Generated CSS (do not edit)
- `theme/main.html` — Base Jinja2 template
- `theme/css/input.css` — Tailwind source CSS
- `theme/favicon.*` — Favicons (served from theme dir, not docs)
- `mkdocs.yml` — Site config and nav

## Blog Posts

- Create new posts in `docs/blog/posts/`
- Add each post to the `nav` section in `mkdocs.yml`
- Required frontmatter:
  ```yaml
  ---
  title: Post Title
  date: YYYY-MM-DD
  description: Short summary shown in card preview
  tags:
    - tag1
  ---
  ```
- Do not include an H1 (`# Title`) in the post body — the template renders `page.title`
- **All posts must be written in Australian English** (e.g. colour, organisation, centralise, behaviour)

## Styling

- Black and white only — no colour accents or gradients
- Dark mode via `.dark` class on `<html>`, toggled with localStorage
- Fonts: Inter (sans), Merriweather (serif), JetBrains Mono (mono)
- Edit `theme/css/input.css` for CSS changes, `theme/main.html` for layout

## Deployment

GitHub Actions builds the Docker `output` stage and deploys to GitHub Pages on push to `main`.
