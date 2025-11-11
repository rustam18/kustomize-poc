#!/bin/bash

# Usage: ./build.sh <revision_limit>
REVISION_LIMIT=${1:-3}  # default is 3 if not specified

# Generate patch dynamically
cat <<EOF > base/revisionhistorylimit-patch.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: dummy
spec:
  revisionHistoryLimit: $REVISION_LIMIT
EOF

echo "Building manifests with revisionHistoryLimit=$REVISION_LIMIT..." >&2
kustomize build base/

