# Devcontainers Repository

This repository hosts multiple devcontainer builds, each organized in its own subdirectory. These builds are published to **GitHub Container Registry (GHCR)** and can be consumed by downstream projects.

## Directory Structure

```
devcontainers/
  9569/
    Dockerfile
  tnl/
    Dockerfile
  nysd/
    Dockerfile
.github/
  workflows/
    build.yml
```

## Devcontainer Images

### Subdirectories

- **`9569/`**: Python 3.7 environment for assessments and lessons.
- **`tnl/`**: Python 3.11 environment for teaching and learning resources.
- **`nysd/`**: Python 3.11 environment for Nanyang System Developer projects.

### Image Tags

- `:latest`: Always points to the most recent build.
- `:YYYYMMDD`: Date-based tags for reproducibility.

## CI/CD Workflow

The GitHub Actions workflow (`build.yml`) automates the following:

1. Detects changes in subdirectories.
2. Builds and pushes the corresponding container to GHCR.
3. Enforces a retention policy to keep `:latest` and builds less than 3 months before `:latest`.

### Triggering Builds

- **Automatic**: On merging a PR to `main`.
- **Manual**: Via workflow dispatch.

### Retention Policy

- Always keep `:latest`.
- Retain all builds less than 3 months before `:latest`.

## Usage

Downstream projects can reference these devcontainers in their `.devcontainer/devcontainer.json`:

```json
{
  "name": "9569-project",
  "image": "ghcr.io/nyjc-computing/devcontainer-9569:latest"
}
```

For reproducibility, pin to a specific date-based tag:

```json
{
  "name": "9569-project",
  "image": "ghcr.io/nyjc-computing/devcontainer-9569:20250922"
}
```

## Notes

- Each subdirectory has its own `Dockerfile`.
- Builds are restricted to one subdirectory per PR.
