# nilesuan.com

Personal blog built with MkDocs and Tailwind CSS, deployed to GitHub Pages.

## Stack

- **MkDocs** — static site generator from Markdown
- **Tailwind CSS v4** — utility-first CSS with Typography plugin
- **Docker** — single build dependency (no local Node/Python needed)
- **GitHub Actions** — automated deployment to GitHub Pages
## Local Development

The only requirement is Docker.

```bash
docker compose up --build
```

Visit [http://localhost:8000](http://localhost:8000). Changes to `docs/`, `theme/`, and `mkdocs.yml` hot-reload automatically.

## Writing Posts

Create a new Markdown file in `docs/blog/posts/` with frontmatter:

```markdown
---
title: My Post Title
date: 2026-02-24
description: A short summary of the post.
tags:
  - example
---

# My Post Title

Post content goes here...
```

Then add it to the `nav` section in `mkdocs.yml`:

```yaml
nav:
  - Home: index.md
  - Blog:
      - blog/posts/my-post.md
```

## Deployment

Push to `main` and GitHub Actions will build and deploy automatically.

**First-time setup**: In your GitHub repo settings, go to **Pages** and set the source to **GitHub Actions**.

## Project Structure

```
.
├── docs/                    # Markdown content
│   ├── index.md             # Homepage
│   └── blog/posts/          # Blog posts
├── theme/                   # Custom MkDocs theme
│   ├── main.html            # Base template
│   ├── 404.html             # 404 page
│   └── css/input.css        # Tailwind entry point
├── mkdocs.yml               # MkDocs configuration
├── Dockerfile               # Multi-stage build (Tailwind + MkDocs)
├── docker-compose.yml       # Dev server with hot reload
├── entrypoint-dev.sh        # Dev entrypoint (Tailwind watch + MkDocs serve)
└── .github/workflows/       # CI/CD
    └── deploy.yml           # GitHub Pages deployment
```
