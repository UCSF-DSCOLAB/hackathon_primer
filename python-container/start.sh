#!/usr/bin/env bash
set -Eeuo pipefail

# Configuration (edit to taste)
IMAGE="alaaatya/single-cell-nb:latest"   
CONTAINER_NAME="single-cell-nb"
HOST_PORT=1037                           

# 1. Ask for a host folder to mount at /home/data
read -erp "📂  Path you’d like to mount inside the container (/home/data): " HOST_DIR
[[ $HOST_DIR == ~* ]] && HOST_DIR="$HOME${HOST_DIR#\~}"   # expand ~
[[ $HOST_DIR != /* ]] && HOST_DIR="$(pwd)/$HOST_DIR"      # make absolute
mkdir -p "$HOST_DIR"

# 2. Apple-silicon machines need the amd64 variant of the image
PLATFORM_FLAG=""
[[ $(uname -m) == "arm64" ]] && PLATFORM_FLAG="--platform linux/amd64"

# 3. Always pull the latest layers for this tag
echo "🔄  Pulling $IMAGE …"
docker pull $PLATFORM_FLAG "$IMAGE"

# 4. Run the Jupyter notebook container
echo "🚀  Open http://localhost:${HOST_PORT} after the token prints ⏳"
docker run -it --rm \
  $PLATFORM_FLAG \
  -p "${HOST_PORT}:1037" \
  -v "${HOST_DIR}:/home/data" \
  -w /home \
  --name "$CONTAINER_NAME" \
  "$IMAGE"
