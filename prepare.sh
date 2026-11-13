#!/bin/sh
set -eu

cd "$(dirname "$0")"
tag=v0.139.0
revision=dc655f8b7c8d2d00c0bf808f6ea1cd17a973959d

if [ ! -e .aftertouch ]; then
    git clone --depth 1 --branch "$tag" https://github.com/gesellix/Bose-SoundTouch.git .aftertouch
fi
if [ "$(git -C .aftertouch rev-parse HEAD)" != "$revision" ]; then
    echo "Expected AfterTouch $tag at $revision" >&2
    exit 1
fi
if git -C .aftertouch apply --reverse --check ../amber.patch 2>/dev/null; then
    exit 0
fi
git -C .aftertouch apply ../amber.patch
