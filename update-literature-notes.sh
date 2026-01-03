#!/bin/bash
# Update literature-notes submodule to latest

set -e

echo "Updating literature-notes submodule to latest..."

cd literature-notes

# Clean untracked files that might block pull (logseq backups, etc.)
if ! git pull origin main 2>/dev/null; then
    echo "⚠️  Pull blocked by untracked files. Cleaning..."
    git clean -fd logseq/bak/ 2>/dev/null || true
    git clean -fd logseq/.recycle/ 2>/dev/null || true
    git pull origin main
fi

cd ..

git add literature-notes
git commit -m "Update literature-notes submodule to latest"

echo "Submodule updated successfully!"
echo "Run 'git push origin master' to push changes"
