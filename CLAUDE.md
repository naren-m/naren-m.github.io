# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal blog and portfolio website built with Jekyll using the Beautiful Jekyll theme. It is hosted on GitHub Pages at `naren-m.github.io`.

## Development Commands

### Local Development with Docker
```bash
# Start Jekyll server in Docker container
docker run -p 4000:4000 -v `pwd`:/app mangar/jekyll:1.1 bash -c "bundle install; bundle exec jekyll serve"

# Access the site at http://localhost:4000
```

### Local Development with Ruby
```bash
# Install dependencies
bundle install

# Serve the site locally with live reload
bundle exec jekyll serve

# Build the site (output in _site/)
bundle exec jekyll build
```

### Working with Content

**Creating a new blog post:**
- Add a markdown file in `_posts/` with format: `YYYY-MM-DD-title.md`
- Required YAML front matter at the top of each post:
  ```yaml
  ---
  layout: post
  title: Your Post Title
  subtitle: Optional subtitle
  published: true
  ---
  ```
- Posts support additional front matter: `comments`, `image`, `bigimg`, `social-share`

**Creating a new page:**
- Add a markdown file in the root directory (e.g., `aboutme.md`)
- Include YAML front matter (two lines with three dashes minimum)

## Site Architecture

### Key Configuration
- **_config.yml**: Central configuration file containing site metadata, navigation links, social media settings, and Jekyll build settings
  - Site owner info, social links, and footer configuration
  - Jekyll settings: timezone (America/Los_Angeles), markdown (kramdown), permalinks, pagination (5 posts per page)
  - Default layouts for posts and pages

### Directory Structure
```
_layouts/         # HTML templates (base, default, page, post, minimal)
_includes/        # Reusable components (nav, header, footer, head, social-share, disqus, analytics)
_posts/           # Blog posts in markdown format with YYYY-MM-DD-title.md naming
_plugins/         # Jekyll plugins
css/              # Stylesheets (Bootstrap-based with custom main.css)
js/               # JavaScript files
img/              # Images and assets
```

### Layouts
- **post**: Blog posts with full header, footer, and social sharing
- **page**: Static pages with similar styling to posts
- **minimal**: Pages without navigation bar and footer
- **base**: Base HTML structure used by other layouts

### YAML Front Matter Parameters
Available parameters for pages and posts:
- `title`, `subtitle`: Page/post titles
- `layout`: post, page, minimal (default: page for non-posts, post for _posts/)
- `bigimg`: Large header image (single path or array for cycling)
- `image`: Thumbnail for post excerpts and social sharing
- `comments`: Enable/disable Disqus comments (default: true for posts)
- `social-share`: Enable/disable social media buttons (default: true for posts)
- `show-avatar`: Control avatar display per page
- `js`, `ext-js`: Local or external JavaScript includes
- `css`, `ext-css`: Local or external CSS includes

### Theme Features
- Mobile-responsive design using Bootstrap
- Social media integration (footer links, sharing buttons)
- Optional Disqus comments (configure shortname in _config.yml)
- Optional Google Analytics (set google_analytics in _config.yml)
- MathJax support for mathematical equations (include via front matter)

### Content Organization
- Blog posts automatically appear on the home page with pagination
- Posts can include code blocks, images, and markdown formatting
- The site supports multilingual content (example: Telugu text in Mahishasura stotram post)

## Important Notes

- GitHub Pages automatically builds and deploys on push to master branch
- Always include YAML front matter (even if empty: `---` on two lines) for Jekyll to process the file
- Do not commit `_site/` directory (it's auto-generated)
- Post filenames must follow `YYYY-MM-DD-title.md` format to be recognized
- Images should be placed in `img/` directory and referenced as `/img/filename`
