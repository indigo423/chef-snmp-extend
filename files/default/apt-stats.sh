#!/bin/bash
# Run apt-get update without doing anything.
# Give just the number of packages to be upgraded

APT_CMD="apt-get -u upgrade --assume-no"

# Print number upgraded
${APT_CMD} | sed -rn 's/(^[[:digit:]]+)[[:space:]]upgraded.*/\1/p'
