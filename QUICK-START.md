# Quick Start: LogSeq → Digital Garden

## Daily Workflow

### 1. Open LogSeq
```bash
# Open LogSeq app
# File → Add Graph → Select:
/Users/nmudivar/Projects/all_notes/naren-m.github.io/literature-notes
```

### 2. Edit & Save
- Create notes with `[[wikilinks]]`
- Edit existing pages
- Use daily journal
- Build connections in graph view

### 3. Commit Changes

**Option A: LogSeq Built-in Git**
- Settings → Features → Version Control → Enable
- LogSeq will auto-commit on sync

**Option B: Manual Git**
```bash
cd literature-notes
git add .
git commit -m "Daily notes update"
git push origin main
```

### 4. Deploy to Garden

```bash
cd /Users/nmudivar/Projects/all_notes/naren-m.github.io
./sync-literature-notes.sh --local
```

**That's it!** Your notes will be live in ~2 minutes at https://naren-m.github.io

---

## Enable Full Auto-Sync (One-Time Setup)

Edit this file:
```bash
nano .git/modules/literature-notes/hooks/post-commit
```

Uncomment these lines (remove the `#`):
```bash
cd "$PARENT_REPO"
./sync-literature-notes.sh --local
```

**After this:** Just commit in LogSeq, everything else is automatic!

---

## Commands Reference

```bash
# Sync local changes
./sync-literature-notes.sh --local

# Pull latest + sync
./sync-literature-notes.sh

# Check deployment status
open https://github.com/naren-m/naren-m.github.io/actions

# View live site
open https://naren-m.github.io
```

---

## Troubleshooting

**Script not found?**
```bash
cd /Users/nmudivar/Projects/all_notes/naren-m.github.io
chmod +x sync-literature-notes.sh
```

**Hook not running?**
```bash
chmod +x .git/modules/literature-notes/hooks/post-commit
```

**More help:**
- Full guide: `cat AUTOMATION.md`
- Digital garden docs: `cat naren-m.github.io/CLAUDE.md`
