#!/usr/bin/env bash

set -eux
set -o pipefail

git pull --tags
git tag > tags.txt
if ! grep -v -f tags.txt "$VERSION_FILE"; then
  echo "===> No update" >&2
  exit 0
fi

if git diff --exit-code "$VERSION_FILE"; then
  ghcp empty-commit -r "$GITHUB_REPOSITORY" -m "update"
else
  ghcp commit -r "$GITHUB_REPOSITORY" -m "update $VERSION_FILE" "$VERSION_FILE"
fi
git checkout -- "$VERSION_FILE"

# push tags
git pull
grep -v -f tags.txt "$VERSION_FILE" | while read -r version; do
  git tag "$version"
  git push origin "$version"
done
