# Project Index - naren-m.github.io

> Digital Garden with bidirectional wikilinks, knowledge graph, and literature notes integration

## Quick Reference

| Aspect | Details |
|--------|---------|
| **Framework** | Jekyll 4.3 |
| **Hosting** | GitHub Pages via GitHub Actions |
| **URL** | https://naren-m.github.io |
| **Content** | `_notes/` collection with `[[wikilink]]` syntax |
| **Build** | `bundle exec jekyll serve --trace` |

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                        BUILD PIPELINE                           │
├─────────────────────────────────────────────────────────────────┤
│  Markdown Notes  →  Jekyll Plugins  →  HTML + Graph JSON        │
│  (_notes/*.md)      (_plugins/*.rb)    (_site/ + notes_graph.json)
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                       RUNTIME FEATURES                          │
├─────────────────────────────────────────────────────────────────┤
│  • [[Wikilinks]] → <a class="internal-link">                    │
│  • Backlinks sidebar (auto-generated)                           │
│  • D3.js force-directed graph visualization                     │
│  • Hover previews for internal links                            │
└─────────────────────────────────────────────────────────────────┘
```

---

## Core Components

### 1. Plugin System (`_plugins/`)

| File | Lines | Purpose |
|------|-------|---------|
| `bidirectional_links_generator.rb` | 111 | **Core engine**: Processes wikilinks, generates backlinks & graph data |
| `open_external_links_in_new_tab.rb` | 28 | Adds `target="_blank"` to external links |
| `embed_tweets.rb` | 22 | Converts tweet URLs to embeds |
| `empty_front_matter_note_injector.rb` | 18 | Ensures valid YAML front matter |
| `last_modified_at_generator.rb` | 18 | Tracks modification timestamps |
| `markdown-highlighter.rb` | 18 | Syntax highlighting for code blocks |

**Key Algorithm** (`bidirectional_links_generator.rb`):
```ruby
# 1. Convert [[wikilinks]] to <a> tags
# 2. Grey out broken links (non-existent targets)
# 3. Build backlinks array for each note
# 4. Generate graph JSON: { nodes: [], edges: [] }
```

### 2. Layout System (`_layouts/`)

| Layout | Used By | Features |
|--------|---------|----------|
| `default.html` | Base template | Header, footer, CSS |
| `note.html` | All notes | Backlinks sidebar, graph embed |
| `page.html` | Static pages | Simplified layout |

### 3. Includes (`_includes/`)

| Include | Purpose |
|---------|---------|
| `notes_graph.html` | D3.js visualization (312 lines) |
| `link-previews.html` | Hover tooltip previews |
| `head.html` | Meta tags, CSS links |
| `nav.html` | Navigation bar |
| `footer.html` | Site footer |
| `search.html` | Search functionality |
| `mathjax.html` | Math rendering support |

### 4. Styles (`_sass/`)

| File | Purpose |
|------|---------|
| `_style.scss` | Main site styles |
| `_code.scss` | Code block highlighting |
| `_normalize.scss` | CSS reset |

---

## Content Structure

### Notes Collection (`_notes/`)

```
_notes/
├── converted-posts/           # 6 migrated blog posts
│   ├── fibonacci-sequence.md
│   ├── quantum-encryption-explained.md
│   ├── Project-Euler-cli-app.md
│   └── ...
├── computer-science.md        # Domain landing page
├── sanskrit-literature.md     # Domain landing page
├── history.md                 # Domain landing page
├── mathematics.md             # Domain landing page
├── media.md                   # Domain landing page
├── people.md                  # Domain landing page
└── [symlinks to literature-notes/]
```

### Literature-Notes Submodule

**Repository**: https://github.com/naren-m/literature-notes

**CI Copy Commands** (from workflow):
| Local Symlink | CI Source Path |
|---------------|----------------|
| `computer-science/` | `content/domains/computer-science` |
| `sanskrit-literature/` | `content/domains/humanities/sanskrit-literature` |
| `history/` | `content/domains/humanities/history` |
| `mathematics/` | `content/domains/mathematics` |
| `media/` | `content/media` |
| `people/` | `content/people` |
| `music/` | `music` |
| `pages/` | `pages` |

---

## Data Flow

### Wikilink Processing

```
Input:  [[Cryptography|crypto note]]
        ↓
Plugin: bidirectional_links_generator.rb
        ↓
Output: <a class='internal-link' href='/cryptography/'>crypto note</a>
```

### Graph Generation

```
All Notes → Plugin scans content → Builds adjacency data → notes_graph.json
                                                              ↓
                                                   D3.js reads JSON
                                                              ↓
                                                   Force-directed graph
```

---

## Configuration

### `_config.yml` Key Settings

```yaml
collections:
  notes:
    output: true
    permalink: /:slug        # Flat URL structure

open_external_links_in_new_tab: true
use_html_extension: false    # Clean URLs
embed_tweets: false          # Privacy consideration
```

### `Gemfile` Dependencies

```ruby
gem 'jekyll', '~> 4.3'
gem 'jekyll-last-modified-at', '~> 1.3'
gem 'webrick', '~> 1.7'      # Local server
gem 'nokogiri', '~> 1.13'    # HTML parsing
gem 'jekyll-feed'            # RSS feed
gem 'jekyll-sitemap'         # SEO sitemap
```

---

## Development Workflow

### Local Development

```bash
# First time setup
bundle install

# Run development server
bundle exec jekyll serve --trace
# → http://localhost:4000

# Build only (no server)
bundle exec jekyll build --trace
```

### Content Workflow

```bash
# Create new note
echo "---\ntitle: My Note\n---\nContent here" > _notes/my-note.md

# Link to other notes
# Use: [[Other Note Title]] or [[other-note|Custom Text]]

# Update literature-notes
cd literature-notes && git pull && cd ..
git add literature-notes && git commit -m "Update submodule"
```

### Deployment

```
Push to master → GitHub Actions → Build with Jekyll → Deploy to Pages
                                      ↓
                    Copies literature-notes content (not symlinks)
```

---

## File Statistics

| Category | Count | Lines |
|----------|-------|-------|
| Ruby plugins | 6 | 215 |
| HTML layouts | 3 | ~150 |
| HTML includes | 7 | ~450 |
| SCSS styles | 3 | ~400 |
| Markdown notes | 12+ | varies |

---

## API Reference

### Front Matter Parameters

```yaml
---
title: "Required"           # Note title (used for wikilinks)
layout: note                # Default for _notes/
type: converted-post        # Optional: content type
date: 2024-01-01            # Optional: original publish date
---
```

### Wikilink Syntax

| Syntax | Output |
|--------|--------|
| `[[Note Title]]` | Link using title |
| `[[note-slug]]` | Link using filename |
| `[[note\|Custom Text]]` | Link with custom display text |
| `[[Nonexistent]]` | Greyed out, shows `[[Nonexistent]]` |

### Generated Data

**`page.backlinks`** (Liquid array):
```liquid
{% for backlink in page.backlinks %}
  {{ backlink.title }} - {{ backlink.url }}
{% endfor %}
```

**`notes_graph.json`** (D3.js input):
```json
{
  "nodes": [{ "id": "...", "path": "/note/", "label": "Note Title" }],
  "edges": [{ "source": "id1", "target": "id2" }]
}
```

---

## Troubleshooting Quick Reference

| Issue | Solution |
|-------|----------|
| Wikilink not working | Check exact title match (case-sensitive) |
| Graph not showing | Verify `notes_graph.json` generated in `_includes/` |
| Backlinks empty | Ensure linking note processed after target |
| Local symlinks broken | Normal; CI uses copy commands |
| Build fails on CI | Check submodule checkout, front matter |

---

*Generated: 2026-01-02 | Source: Project analysis by Claude Code*
