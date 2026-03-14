#!/bin/bash

set -euo pipefail

# Build theme assets
cd ./themes/akari
bun install
bun run build:css
cd ../..

# Build the final static site
# Hugo will generate the 'public/' directory in the root
hugo --minify
