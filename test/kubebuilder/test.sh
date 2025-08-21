#!/bin/bash

# This script is run inside the dev container to test the kubebuilder feature.
# It checks if kubebuilder is installed and if the version matches the latest release.

set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Get the latest version of kubebuilder from GitHub
LATEST_KUBEBUILDER_VERSION=$(curl -s https://api.github.com/repos/kubernetes-sigs/kubebuilder/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')

# Check if kubebuilder is installed and the version matches the latest release
check "execute command" kubebuilder version | grep -q "${LATEST_KUBEBUILDER_VERSION#v}"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
