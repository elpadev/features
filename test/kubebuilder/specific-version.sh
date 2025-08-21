#!/bin/bash

# This script is run inside the dev container to test the kubebuilder feature.
# It checks if kubebuilder is installed and if the version matches the expected version.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "execute command" kubebuilder version | grep -q "${version#v}"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
