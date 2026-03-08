#!/bin/bash

set -euo pipefail

cd ./themes/akari

"$HOME/.bun/bin/bun" install

"$HOME/.bun/bin/bun" run build:css
