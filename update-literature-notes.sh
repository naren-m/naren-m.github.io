#!/bin/bash
# Update literature-notes submodule to latest

set -e

echo "Updating literature-notes submodule to latest..."

cd literature-notes
git pull origin main
cd ..

git add literature-notes
git commit -m "Update literature-notes submodule to latest"

echo "Submodule updated successfully!"
echo "Run 'git push origin master' to push changes"
