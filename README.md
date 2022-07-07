# WooCommerce Extension Workflows

This repo contains reusable workflows and actions used in the development of the WooCommerce extensions.

## Workflows

These are the available workflows:

### Check PHP Coding Standards

Validates the coding standards with PHP_CodeSniffer of the latest modified files.
Can be triggered for `push` and `pull_request` events.

#### Usage example

```yaml
name: Check PHP Coding Standards
on:
  - pull_request
  - push

defaults:
  run:
    shell: bash

jobs:
  phpcs:
    uses: koilabcode/wc-extension-workflows/.github/workflows/check-phpcs.yml@main
    secrets:
      GITHUB_PAT: ${{ secrets.GITHUB_PAT }}
```

### Create Release

Creates a new release including the extension's Zip file as a downloadable source.
This workflow must be used when pushing new tags to upstream.

#### Usage example

```yaml
name: Create release
on:
  push:
    tags:
      - '[0-9]+.[0-9]+.[0-9]+'

jobs:
  build-release:
    uses: koilabcode/wc-extension-workflows/.github/workflows/create-release.yml@main
    with:
      filename: woocommerce-extension
    secrets:
      GITHUB_PAT: ${{ secrets.GITHUB_PAT }}
```