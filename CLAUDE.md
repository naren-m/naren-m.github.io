# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal digital garden built with Jekyll, integrating the [digital-garden-jekyll-template](https://github.com/maximevaillancourt/digital-garden-jekyll-template) with the literature-notes repository as a git submodule. The site features bidirectional wikilinks, knowledge graph visualization, and evergreen notes. It is hosted on GitHub Pages at `naren-m.github.io`.

**Key Features:**
- Bidirectional wikilinks with automatic backlinks
- Interactive D3.js knowledge graph visualization
- Literature notes integrated via git submodule
- Evergreen notes (timeless, non-chronological content)
- Flat URL structure (`/slug/` instead of `/YYYY/MM/DD/slug/`)

## Development Commands

### Local Development with Ruby

**Prerequisites:**
- Ruby 3.1+ (use rbenv or RVM to avoid system Ruby sudo issues)
- Bundler

```bash
# Install dependencies
bundle install

# Serve the site locally with live reload
bundle exec jekyll serve --trace

# Build the site (output in _site/)
bundle exec jekyll build --trace

# Access the site at http://localhost:4000
```

### Working with Content

**Creating a new note:**
- Add a markdown file in `_notes/` directory
- Filename format: `note-slug.md` (no date prefix)
- Required YAML front matter:
  ```yaml
  ---
  title: Your Note Title
  ---
  ```
- Use `[[Wikilink Syntax]]` to link to other notes
- Backlinks are automatically generated

**Wikilink syntax:**
```markdown
This is a link to [[Another Note]].
You can also use [[custom-slug|Custom Link Text]].
```

**Converting blog posts to notes:**
- Use the conversion script: `/Users/nmudivar/Projects/all_notes/temp-migration/convert-posts.py`
- Converts date-prefixed posts to timeless notes
- Preserves original publish date in front matter

### Literature-Notes Submodule

**Update literature-notes to latest:**
```bash
cd literature-notes
git pull origin main
cd ..
git add literature-notes
git commit -m "Update literature-notes submodule to latest"
git push origin master
```

**Reinitialize submodule after fresh clone:**
```bash
git submodule init
git submodule update --remote
```

## Site Architecture

### Key Configuration
- **_config.yml**: Central configuration file
  - Site title: "Naren Mudivarthy's Digital Garden"
  - URL: http://naren-m.github.io
  - Collections: `_notes` with permalink `/:slug`
  - Plugins: jekyll-last-modified-at
  - Open external links in new tab: true

### Directory Structure
```
naren-m.github.io/
├── _notes/                    # Primary content collection
│   ├── converted-posts/       # Migrated blog posts (evergreen)
│   ├── CSE/ -> ../literature-notes/CSE/           # Symlink
│   ├── books/ -> ../literature-notes/books/       # Symlink
│   ├── highlights/ -> ../literature-notes/highlights/
│   ├── sanskrit-lit/ -> ../literature-notes/sanskrit-lit/
│   ├── people/ -> ../literature-notes/people/
│   ├── math/ -> ../literature-notes/math/
│   ├── Security/ -> ../literature-notes/Security/
│   ├── Statistics/ -> ../literature-notes/Statistics/
│   └── india/ -> ../literature-notes/india/
├── _layouts/
│   ├── default.html           # Base layout
│   ├── note.html              # Note layout with backlinks
│   └── page.html              # Static pages
├── _includes/
│   ├── head.html
│   ├── nav.html
│   ├── footer.html
│   ├── link-previews.html     # Hover preview tooltips
│   └── notes_graph.html       # D3.js graph visualization
├── _plugins/                  # Critical: Custom generators
│   ├── bidirectional_links_generator.rb  # Wikilink processing
│   ├── last_modified_at_generator.rb
│   ├── empty_front_matter_note_injector.rb
│   ├── markdown-highlighter.rb
│   └── open_external_links_in_new_tab.rb
├── _sass/
│   ├── _style.scss            # Main styles
│   ├── _code.scss             # Code highlighting
│   └── _normalize.scss        # CSS reset
├── assets/
│   └── js/                    # JavaScript files
├── literature-notes/          # Git submodule (independent repo)
├── _config.yml
├── .gitmodules
├── .gitignore
└── .github/workflows/
    └── deploy-digital-garden.yml  # GitHub Actions deployment
```

### URL Structure
- **Homepage**: `https://naren-m.github.io/` (note list + graph)
- **Notes**: `https://naren-m.github.io/note-slug/` (flat, no dates)
- **Converted posts**: `https://naren-m.github.io/fibonacci-sequence/` (date removed)
- **Literature notes**: `https://naren-m.github.io/cryptography/` (from submodule)

### Layouts
- **default**: Base layout for all pages
- **note**: Note layout with backlinks sidebar and graph integration
- **page**: Static pages (aboutme, etc.)

### YAML Front Matter Parameters
Available parameters for notes:
- `title`: Note title (required)
- `date`: Original publish date for converted posts
- `type`: Note type (e.g., `converted-post`)
- `layout`: Defaults to `note` for `_notes/` content

## Custom Jekyll Plugins

### Critical Plugins (Required for Digital Garden)

**bidirectional_links_generator.rb**
- Processes `[[Wikilink Syntax]]` into clickable links
- Generates automatic backlinks (shows which notes reference this note)
- Creates graph data structure for D3.js visualization
- Handles broken links (greyed out if target doesn't exist)

**last_modified_at_generator.rb**
- Tracks last modification time for notes
- Used for "Recently Updated" homepage section

**empty_front_matter_note_injector.rb**
- Ensures all notes have valid front matter
- Prevents Jekyll build errors

**open_external_links_in_new_tab.rb**
- Automatically opens external links in new tab (UX enhancement)

**markdown-highlighter.rb**
- Syntax highlighting for code blocks in notes

## GitHub Actions Deployment

**Workflow**: `.github/workflows/deploy-digital-garden.yml`

**Key Configuration:**
- Triggers: Push to `master` or `migration/digital-garden`
- Ruby version: 3.1
- Critical: `submodules: recursive` to fetch literature-notes
- Uses GitHub Pages deployment action

**GitHub Pages Settings Required:**
- Repository Settings → Pages
- Source: **GitHub Actions** (NOT "Deploy from branch")
- This allows custom Jekyll plugins to run

**Why GitHub Actions?**
- GitHub Pages safe mode blocks custom plugins
- Custom plugins are REQUIRED for:
  - Bidirectional wikilink processing
  - Backlink generation
  - Graph data structure creation

## Literature-Notes Integration

### Submodule Structure
- **Repository**: https://github.com/naren-m/literature-notes
- **Branch**: main
- **Integration**: Symlinks from `_notes/` to submodule directories

### Domains Integrated (9 total)
- CSE: Computer science, cryptography, design patterns
- books: Book summaries and literature
- highlights: Book highlights and article summaries
- sanskrit-lit: Sanskrit literature and philosophy
- people: Biographical notes
- math: Mathematical concepts
- Security: Security-related notes
- Statistics: Statistical concepts
- india: Indian culture and history

### Excluded from Build (in .gitignore)
```
literature-notes/*.py
literature-notes/*.db
literature-notes/.venv/
literature-notes/__pycache__/
literature-notes/zettelkasten.db
literature-notes/requirements.txt
literature-notes/*.json
literature-notes/api/
literature-notes/graph/
```

## Knowledge Graph Visualization

**Technology**: D3.js force-directed graph

**Features:**
- Interactive nodes (clickable)
- Hover to highlight connections
- Zoom and pan support
- Color-coded by note type/domain

**Performance Optimization:**
- Pre-calculates force simulation (200 ticks before display)
- Handles 100+ notes efficiently

**Implementation:**
- Graph data generated by `bidirectional_links_generator.rb`
- Visualization in `_includes/notes_graph.html`

## Content Migration Notes

### Converted Blog Posts (6 total)
Located in `_notes/converted-posts/`:
- 2017-2-28-Using-Anaconda-for-creating-virtual-environment.md
- Mahishasura-Mardhini-stotram.md
- Project-Euler-cli-app.md
- fibonacci-sequence.md
- quantum-encryption-explained.md
- test-markdown.md

**Migration Changes:**
- Date prefix removed from filename
- URL changed from `/YYYY/MM/DD/slug/` to `/slug/`
- Original publish date preserved in front matter
- Added "Originally published" note at top

### Breaking Changes from Beautiful Jekyll
- ❌ Date-based URLs (old URLs will 404)
- ❌ Beautiful Jekyll theme and Bootstrap removed
- ❌ Social sharing buttons removed
- ❌ Disqus comments removed
- ❌ Pagination removed (replaced with graph navigation)
- ✅ Gained: Bidirectional linking, knowledge graph, timeless notes

## Development Workflow

### Making Changes to Notes
1. Edit markdown files in `_notes/` or within `literature-notes/` submodule
2. Use `[[Wikilink]]` syntax for internal links
3. Test locally: `bundle exec jekyll serve`
4. Commit and push to trigger GitHub Actions build

### Updating Literature-Notes
1. Work in `literature-notes/` directory
2. Commit and push changes to literature-notes repository
3. Update submodule reference in parent repo:
   ```bash
   cd literature-notes
   git pull origin main
   cd ..
   git add literature-notes
   git commit -m "Update literature-notes submodule"
   git push
   ```

### Troubleshooting Build Failures

**Check GitHub Actions logs:**
- Repository → Actions tab
- Look for Jekyll build errors
- Common issues:
  - Missing front matter in notes
  - Broken wikilinks (non-critical, just greyed out)
  - Submodule not checked out properly
  - Ruby gem version conflicts

**Local debugging:**
```bash
# Verbose build output
bundle exec jekyll build --trace --verbose

# Check for plugin errors
bundle exec jekyll build --trace 2>&1 | grep -i error
```

## Important Notes

- Custom plugins REQUIRE GitHub Actions deployment (not standard GitHub Pages)
- Symlinks work on macOS/Linux; Windows may need copy approach
- Literature-notes remains an independent, deployable repository
- Original Beautiful Jekyll backups in `backups/20251210/`
- Migration plan: `.claude/plans/shimmying-drifting-whale.md`

## Rollback Strategy

If issues arise:
1. Revert migration commit: `git revert 606a4ff`
2. Or restore from backup: `backups/pre-digital-garden-*.tar.gz`
3. Or force push from backup directory

## Testing Checklist

- [ ] Homepage renders with recently updated notes
- [ ] Knowledge graph displays and is interactive
- [ ] Wikilinks are clickable
- [ ] Backlinks appear in note sidebar
- [ ] Hover previews work on wikilink hover
- [ ] Literature notes accessible (test `/cryptography/`)
- [ ] Converted blog posts work (test `/fibonacci-sequence/`)
- [ ] Mobile responsive (375px, 768px, 1024px)
- [ ] External links open in new tab
