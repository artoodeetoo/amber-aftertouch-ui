# Amber for AfterTouch

Amber is a UI overlay for [AfterTouch](https://github.com/gesellix/Bose-SoundTouch). It adds a charcoal and amber speaker view with artwork presets, recents, and persistent playback controls.

This repository carries the UI patch and packaging workflow. AfterTouch does not provide a runtime plugin interface for this overlay. The build checks out a pinned AfterTouch revision and embeds Amber in the player before building the container.

Run `sh prepare.sh` to fetch and patch the source. Then run:

```sh
docker build --target soundtouch-service -t amber-aftertouch-ui:local .aftertouch
```

To publish a version, push a tag such as `amber-v0.1.1`. GitHub Actions builds an AMD64 and ARM64 image. The workflow also supports manual dispatch for an existing Amber tag.

In Portainer, authenticate to GHCR and update the image in your existing AfterTouch stack to `ghcr.io/artoodeetoo/amber-aftertouch-ui:0.1.1`. Keep the stack's port mappings and data volume.

For an upstream update, revise the tag and commit in `prepare.sh`, refresh the UI patch against that revision, and verify the player before publishing a new Amber tag.

Amber uses the MIT license. AfterTouch is maintained separately by Tobias Gesellchen and its contributors.
