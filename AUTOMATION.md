# Digital Garden Automation Guide

This guide explains how to automatically sync LogSeq notes to your digital garden.

## Overview

Your setup:
- **LogSeq vault**: `literature-notes/` (git submodule)
- **Digital garden**: `naren-m.github.io/` (parent repo)
- **Deployment**: GitHub Actions → GitHub Pages

## Automation Workflow

### Current Setup (Semi-Automatic)

```
LogSeq edits → Save file → Git commit → Post-commit hook → Manual sync → Deploy
```

**After editing in LogSeq:**

1. **Commit changes** in LogSeq/literature-notes:
   ```bash
   cd literature-notes
   git add .
   git commit -m "Add new notes from LogSeq"
   git push origin main
   ```

2. **Sync to digital garden** (one command):
   ```bash
   cd ..
   ./sync-literature-notes.sh --local
   ```

The git hook will remind you to run step 2 after every commit.

### Quick Sync Commands

**Option A: Sync local changes only**
```bash
./sync-literature-notes.sh --local
```
Use this when you've already committed changes in literature-notes.

**Option B: Pull latest from remote + sync**
```bash
./sync-literature-notes.sh
```
Use this to pull the latest changes from literature-notes repo and deploy.

## Full Automation Setup (Optional)

To make it fully automatic (no manual sync needed), uncomment these lines in the git hook:

**File**: `.git/modules/literature-notes/hooks/post-commit`

```bash
# Change these lines (remove the # at the start):
# cd "$PARENT_REPO"
# ./sync-literature-notes.sh --local

# To:
cd "$PARENT_REPO"
./sync-literature-notes.sh --local
```

**After this change:**
```
LogSeq edits → Save → Git commit → Auto-sync → Auto-deploy ✨
```

## LogSeq Workflow

### Daily Usage

1. **Open LogSeq**:
   - File → Add Graph → Select `literature-notes/` folder

2. **Edit notes**:
   - Create new pages
   - Add [[wikilinks]]
   - Use daily journal
   - Build knowledge graph

3. **Commit from LogSeq**:
   - LogSeq has built-in git sync (Settings → Version Control)
   - Or manually: `cd literature-notes && git add . && git commit -m "..." && git push`

4. **Sync to garden**:
   - **Manual**: Run `./sync-literature-notes.sh --local`
   - **Auto**: Enabled if you uncommented hook lines

5. **Verify deployment**:
   - Check GitHub Actions: https://github.com/naren-m/naren-m.github.io/actions
   - View site: https://naren-m.github.io

### Tips

- **Wikilinks**: Use `[[Note Title]]` syntax (works in both LogSeq and Jekyll)
- **Daily notes**: Go to `journals/` automatically
- **Tags**: Use `#tag` format
- **Backlinks**: Automatically generated in digital garden
- **Graph**: LogSeq graph view + digital garden D3.js graph

## Troubleshooting

### Hook not running?

Check if it's executable:
```bash
ls -l .git/modules/literature-notes/hooks/post-commit
# Should show: -rwxr-xr-x (note the x for executable)

# If not, make it executable:
chmod +x .git/modules/literature-notes/hooks/post-commit
```

### Sync script not working?

```bash
# Make sure it's executable
chmod +x sync-literature-notes.sh

# Test it
./sync-literature-notes.sh --local
```

### Submodule out of sync?

```bash
# Reset submodule to latest
git submodule update --remote literature-notes
./sync-literature-notes.sh --local
```

### Changes not appearing in garden?

1. Check GitHub Actions logs for build errors
2. Verify files are in tracked directories (CSE, books, etc.)
3. Ensure wikilinks use correct syntax: `[[Page Title]]`
4. Clear browser cache or check in incognito mode

## Architecture

```
literature-notes/              (Submodule: independent git repo)
├── CSE/                       → Copied to _notes/CSE/
├── books/                     → Copied to _notes/books/
├── highlights/                → Copied to _notes/highlights/
├── journals/                  (LogSeq daily notes)
├── pages/                     (LogSeq pages)
└── logseq/                    (LogSeq config)

_notes/                        (Jekyll content directory)
├── CSE/                       ← From literature-notes
├── books/                     ← From literature-notes
├── converted-posts/           (Migrated blog posts)
└── ...

GitHub Actions:
1. Checkout with submodules: recursive
2. Copy literature-notes/* to _notes/
3. Build Jekyll with custom plugins
4. Deploy to GitHub Pages
```

## Advanced: GitHub Actions Automation

For fully automatic sync without local commands, set up a GitHub Actions workflow in the literature-notes repo that triggers the parent repo. This requires a Personal Access Token (PAT).

See: https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#repository_dispatch

## Summary

**Simplest workflow:**
1. Edit in LogSeq
2. Commit: `git add . && git commit -m "..." && git push`
3. Sync: `./sync-literature-notes.sh --local`
4. Done! Live in ~2 minutes.

**Full auto (after enabling in hook):**
1. Edit in LogSeq
2. Commit with LogSeq's built-in git sync
3. Done! Everything else is automatic.
