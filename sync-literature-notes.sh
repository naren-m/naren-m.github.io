#!/bin/bash
# Sync literature-notes submodule and deploy to digital garden
#
# Usage:
#   ./sync-literature-notes.sh           # Pull latest and deploy
#   ./sync-literature-notes.sh --local   # Update from local changes only

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "🔄 Syncing literature-notes with digital garden..."

# Navigate to literature-notes submodule
cd literature-notes

# Check if we should pull from remote
if [[ "$1" != "--local" ]]; then
    echo "📥 Pulling latest changes from literature-notes repository..."
    # Clean untracked files that might block pull (logseq backups, etc.)
    if ! git pull origin main 2>/dev/null; then
        echo "⚠️  Pull blocked by untracked files. Cleaning logseq backups..."
        git clean -fd logseq/bak/ 2>/dev/null || true
        git clean -fd logseq/.recycle/ 2>/dev/null || true
        git pull origin main
    fi
else
    echo "📝 Using local literature-notes changes..."
fi

# Get the current commit hash
COMMIT_HASH=$(git rev-parse --short HEAD)
COMMIT_MSG=$(git log -1 --pretty=%B)

# Navigate back to parent repo
cd ..

# Check if submodule reference changed
if git diff --quiet literature-notes; then
    echo "✅ Literature-notes already up to date (commit: $COMMIT_HASH)"
    exit 0
fi

# Update submodule reference
echo "📝 Updating submodule reference to commit: $COMMIT_HASH"
git add literature-notes

# Create commit message
if [[ "$1" == "--local" ]]; then
    git commit -m "Update literature-notes submodule to $COMMIT_HASH

Local changes: $COMMIT_MSG"
else
    git commit -m "Update literature-notes submodule to latest

Latest commit: $COMMIT_MSG"
fi

# Push to trigger deployment
echo "🚀 Pushing to trigger GitHub Actions deployment..."
git push origin master

echo ""
echo "✅ Done! Your digital garden will update in ~2-3 minutes."
echo "   View deployment: https://github.com/naren-m/naren-m.github.io/actions"
echo "   Live site: https://naren-m.github.io"
