# Dev Container Feature: Kubebuilder

> This repository provides a custom [dev container Feature](https://containers.dev/implementors/features/) that installs Kubebuilder, hosted for free on GitHub Container Registry. The implementation follows the [dev container Feature distribution specification](https://containers.dev/implementors/features-distribution/).

## Overview

This feature installs [Kubebuilder](https://github.com/kubernetes-sigs/kubebuilder), a framework for building Kubernetes APIs using custom resource definitions (CRDs). Kubebuilder provides scaffolding and code generation to help you build and deploy Kubernetes operators and controllers.

## Example Usage

### Basic Installation

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/elpadev/features/kubebuilder:1": {}
    }
}
```

### Specific Version Installation

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/elpadev/features/kubebuilder:1": {
            "version": "3.12.0"
        }
    }
}
```

### Testing the Installation

```bash
$ kubebuilder version
Version: main.version{KubeBuilderVersion:"3.12.0", ...}

$ kubebuilder init --domain example.com --repo example.com/my-operator
Writing scaffold for you to edit...
```

## Feature Structure

```
src/
└── kubebuilder/
    ├── devcontainer-feature.json
    └── install.sh
```

The feature follows the standard dev container Feature structure with:
- **devcontainer-feature.json**: Contains metadata and configuration options
- **install.sh**: Installation script executed during container build

## Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `version` | string | `"latest"` | Choose the version of kubebuilder. See [releases](https://github.com/kubernetes-sigs/kubebuilder/releases/) for available versions. |

### Version Option Details

The `version` option accepts:
- `"latest"` (default): Installs the most recent stable release
- Specific version strings (e.g., `"3.12.0"`, `"3.11.1"`): Installs the specified version
- Version strings should match those available in the [Kubebuilder releases](https://github.com/kubernetes-sigs/kubebuilder/releases/)

## Dependencies

This feature automatically installs the following dependencies:
- **curl** (via `ghcr.io/devcontainers-extra/features/curl-apt-get:1`)
- **Go** (via `ghcr.io/devcontainers/features/go:1`)

The installation order ensures that common utilities, curl, and Go are installed before Kubebuilder.

## What Gets Installed

- Kubebuilder binary in `/usr/local/bin/kubebuilder`
- All necessary Go toolchain components
- Required system dependencies via curl



## Versioning and Publishing

This Feature is versioned according to [semver specification](https://semver.org/) and published to GitHub Container Registry (GHCR) using GitHub Actions.

### Available Versions
- **Latest**: `ghcr.io/elpadev/features/kubebuilder:1`
- **Specific version**: `ghcr.io/elpadev/features/kubebuilder:1.0.0`

## Contributing

To contribute to this Feature or report issues:
1. Visit the [source repository](https://github.com/elpadev/features)
2. Check existing issues or create a new one
3. Submit pull requests for improvements

## License

This feature follows the same licensing as the Kubebuilder project. See the [Kubebuilder repository](https://github.com/kubernetes-sigs/kubebuilder) for license details.

---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/elpadev/features/blob/main/src/kubebuilder/devcontainer-feature.json). Add additional notes to a `NOTES.md` file._
