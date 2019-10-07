#!/bin/bash

set -xe

sync_repo() {
    local repo_dir=$1
    for dir in "$repo_dir"/*; do
        if [ -d "${dir}" ]; then
            helm dependency build "$dir"
            helm package --destination "$repo_dir" "$dir"
        fi
    done

    git add "$repo_dir/"*.tgz
    git commit -m "chore: Add new releases for $repo_dir"
    git push
    helm repo index --url https://oxyno-zeta.github.io/helm-charts/"$repo_dir"/ --merge "$repo_dir"/index.yaml "$repo_dir"/
    git add "$repo_dir"/index.yaml
    git commit -m "chore: Publish new releases for $repo_dir"
    git push
}

git checkout gh-pages

git merge master -m "Merge master"

# Stable case
sync_repo stable

# Incubator case
# sync_repo incubator
