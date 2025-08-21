#!/bin/sh

set -e

echo "Activating feature 'kubebuilder'"
echo "The provided version is: ${VERSION}"

# Download kubebuilder and install it.

# if VERSION if latest
if [ "${VERSION}" = 'latest' ]; then
  curl -L -o kubebuilder "https://go.kubebuilder.io/dl/latest/$(go env GOOS)/$(go env GOARCH)"
else
  curl -L -o kubebuilder "https://github.com/kubernetes-sigs/kubebuilder/releases/download/${VERSION}/kubebuilder_$(go env GOOS)_$(go env GOARCH)"
fi

chmod +x ./kubebuilder
mv ./kubebuilder /usr/local/bin/

exit 0
