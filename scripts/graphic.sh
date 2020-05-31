#!/usr/bin/env bash

set -Cue

# Move to root directory
cd "$(dirname $0)/.."

# Default commands
DEFAULT="i3"
CMD=${1:-""}

# Function to check the existence
check_if_exist() {
  echo "2"
}
