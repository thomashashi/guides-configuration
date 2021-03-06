#!/bin/bash

## DON'T FORGET TO UPDATE the README with any version bumps ##

# X.Y.Z or X.Y.Z-ent for Enterprise binary (e.g. 1.0.6 or 1.0.6-ent)
export CONSUL_VERSION="1.0.6-ent"

# X.Y.Z or X.Y.Z-ent for Enterprise binary (e.g. 0.10.0 or 0.10.0-ent)
export VAULT_VERSION="0.10.0-ent"

# X.Y.Z or X.Y.Z-ent for Enterprise binary (e.g. 0.8.0 or 0.8.0-ent)
export NOMAD_VERSION="0.8.0-ent"

# X.Y.Z (e.g. 0.12.3)
export PACKER_VERSION="1.1.3"

# X.Y.Z (e.g. 0.10.0)
export TERRAFORM_VERSION="0.11.1"

# Production release: X.Y.Z (e.g. 0.1.0)
# Release candidate: X.Y.Z-rcX (e.g. 0.1.0-rc1)
# Beta release: X.Y.Z-betaX (e.g. 0.1.0-beta1)
# Development branch: X.Y.Z-f-branch (e.g. 0.1.0-f-branch)
export RELEASE_VERSION="0.1.0"

# Force build or run on feature branch
export RUN_BUILD=false
export RUN_PUBLISH=false
