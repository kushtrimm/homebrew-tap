# Homebrew Tap for Orikon

This is a [Homebrew](https://brew.sh/) tap for [Orikon](https://github.com/kushtrimm/orikon), a unified dashboard for Apache Flink jobs across multiple EKS clusters.

## Installation

```bash
# Add the tap
brew tap kushtrimm/tap

# Install Orikon
brew install --cask orikon
```

Or install directly:

```bash
brew install --cask kushtrimm/tap/orikon
```

## Updating

```bash
brew update
brew upgrade --cask orikon
```

## Uninstalling

```bash
brew uninstall --cask orikon

# To also remove configuration files
brew uninstall --cask --zap orikon
```

## Available Casks

| Cask | Description |
|------|-------------|
| orikon | Unified dashboard for Apache Flink jobs across multiple EKS clusters |

## Requirements

- macOS 11 (Big Sur) or later
- Apple Silicon (arm64) or Intel (amd64) processor

## Links

- [Orikon Repository](https://github.com/kushtrimm/orikon)
- [Releases](https://github.com/kushtrimm/orikon/releases)
