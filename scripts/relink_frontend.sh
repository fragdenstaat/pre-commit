#!/usr/bin/env bash

set -eo pipefail

if [ -f "node_modules/.linked" ]; then
    mapfile -t packages < node_modules/.linked
    args=()

    for path in "${packages[@]}"; do
        args+=("$(realpath "$path")")
    done

    pnpm link "${args[@]}"
    rm node_modules/.linked
fi
