#!/bin/bash

set -euo pipefail

cd ./themes/akari

bun install

bun run build:css