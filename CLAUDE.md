# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A personal digital garden built with Jekyll, integrating the [digital-garden-jekyll-template](https://github.com/maximevaillancourt/digital-garden-jekyll-template) with the literature-notes repository as a git submodule. Hosted on GitHub Pages at `naren-m.github.io`.

**Key Features:**
- Bidirectional wikilinks with automatic backlinks
- Interactive D3.js knowledge graph visualization
- Literature notes integrated via git submodule
- Flat URL structure (`/slug/` instead of `/YYYY/MM/DD/slug/`)

## Development Commands

```bash
# Install dependencies
bundle install

# Serve locally with live reload (access at http://localhost:4000)
bundle exec jekyll serve --trace

# Build the site (output in _site/)
bundle exec jekyll build --trace

# Verbose debugging
bundle exec jekyll build --trace --verbose 2>&1 | grep -i error
```

**Prerequisites:** Ruby 3.1+ (use rbenv or RVM), Bundler

### Working with Content

**Creating a new note:**
- Add markdown file in `_notes/` with format `note-slug.md`
- Required front matter:
  ```yaml
  ---
  title: Your Note Title
  ---
  ```
- Use `[[Wikilink Syntax]]` or `[[custom-slug|Custom Link Text]]` for internal links
- Backlinks are auto-generated

### Literature-Notes Submodule

```bash
# Update to latest
cd literature-notes && git pull origin main && cd ..
git add literature-notes
git commit -m "Update literature-notes submodule"

# Reinitialize after fresh clone
git submodule init && git submodule update --remote
```

## Architecture

### Critical: How Content Flows to Production

**Local Development:** Symlinks in `_notes/` point to `literature-notes/` directories

**GitHub Actions Build:** The workflow **copies** content from literature-notes (not symlinks):
```yaml
# From .github/workflows/deploy-digital-garden.yml
cp -r literature-notes/content/domains/computer-science _notes/
cp -r literature-notes/content/domains/humanities/sanskrit-literature _notes/
cp -r literature-notes/content/domains/humanities/history _notes/
cp -r literature-notes/content/domains/mathematics _notes/
cp -r literature-notes/content/media _notes/
cp -r literature-notes/content/people _notes/
cp -r literature-notes/music _notes/
cp -r literature-notes/pages _notes/
```

**Important:** If literature-notes structure changes, update the GitHub Actions workflow copy commands.

### Key Directories

```
_notes/                    # Primary content collection
├── converted-posts/       # Migrated blog posts
├── computer-science/      # → symlink to literature-notes
├── sanskrit-literature/   # → symlink to literature-notes
├── *.md                   # Domain landing pages (e.g., computer-science.md)
_plugins/                  # Custom Jekyll generators (REQUIRED for wikilinks)
_includes/notes_graph.html # D3.js graph visualization
literature-notes/          # Git submodule
```

### Custom Jekyll Plugins

These plugins are **critical** for the digital garden functionality:

| Plugin | Purpose |
|--------|---------|
| `bidirectional_links_generator.rb` | Processes `[[wikilinks]]`, generates backlinks, creates graph data |
| `last_modified_at_generator.rb` | Tracks modification times for "Recently Updated" |
| `empty_front_matter_note_injector.rb` | Ensures valid front matter on all notes |
| `open_external_links_in_new_tab.rb` | UX: external links open in new tab |
| `markdown-highlighter.rb` | Syntax highlighting for code blocks |

### GitHub Actions Deployment

**Workflow:** `.github/workflows/deploy-digital-garden.yml`

**Why GitHub Actions (not standard GitHub Pages)?**
- GitHub Pages safe mode blocks custom plugins
- Custom plugins are REQUIRED for wikilink processing, backlinks, and graph generation

**Required GitHub Settings:** Repository Settings → Pages → Source: **GitHub Actions**

**Triggers:** Push to `master` or `migration/digital-garden` branches

### URL Structure

- Homepage: `https://naren-m.github.io/`
- Notes: `https://naren-m.github.io/note-slug/`
- Domain landing: `https://naren-m.github.io/computer-science/`

## Integrated Literature Domains

| Domain | Content Path |
|--------|--------------|
| computer-science | `content/domains/computer-science` |
| sanskrit-literature | `content/domains/humanities/sanskrit-literature` |
| history | `content/domains/humanities/history` |
| mathematics | `content/domains/mathematics` |
| media | `content/media` |
| people | `content/people` |
| music | `music` |
| pages | `pages` |

## Troubleshooting

**Build failures:**
- Check GitHub Actions logs (Repository → Actions)
- Common: Missing front matter, submodule not checked out, Ruby gem conflicts

**Broken wikilinks:** Non-critical; just display greyed out

**Local symlinks broken:** Normal if literature-notes submodule structure changed; CI uses copy commands

## Testing Checklist

- [ ] Homepage renders with recently updated notes
- [ ] Knowledge graph displays and is interactive
- [ ] Wikilinks are clickable with hover previews
- [ ] Backlinks appear in note sidebar
- [ ] External links open in new tab
