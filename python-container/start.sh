#!/usr/bin/env bash
set -Eeuo pipefail

IMAGE_TAG="single-cell-nb:local"
CONTAINER_NAME="single-cell-nb"
HOST_PORT=1037

# 0. Helper: calculate digest of build context (Dockerfile + files it COPYs)
context_hash() {
  # Hash the exact directory Docker sees during `docker build .`
  # Use sha256sum if available (Linux); otherwise fall back to shasum -a 256 (macOS)
  if command -v sha256sum >/dev/null 2>&1; then
    tar -cf - --exclude='.git' . | sha256sum | awk '{print $1}'
  else
    tar -cf - --exclude='.git' . | shasum -a 256 | awk '{print $1}'
  fi
}

# 1. Ask for host directory and make it absolute
read -erp "📂  Mount path (/home/data): " HOST_DIR
[[ $HOST_DIR == ~* ]] && HOST_DIR="$HOME${HOST_DIR#\~}"
[[ $HOST_DIR != /* ]] && HOST_DIR="$(pwd)/$HOST_DIR"
mkdir -p "$HOST_DIR"

# 2. Platform override (Apple-silicon → x86 image)
PLATFORM_FLAG=""
[[ $(uname -m) == "arm64" ]] && PLATFORM_FLAG="--platform linux/amd64"

# 3. Rebuild only when context changed
CTX_HASH=$(context_hash)
LABEL_KEY="scnb.context_sha"
CURRENT_HASH=$(docker image inspect "$IMAGE_TAG" \
               --format "{{ index .Config.Labels \"$LABEL_KEY\" }}" 2>/dev/null || echo "")

if [[ "$CTX_HASH" != "$CURRENT_HASH" ]]; then
  echo "🔨  Building image ($IMAGE_TAG)…"
  docker build $PLATFORM_FLAG \
    --label "$LABEL_KEY=$CTX_HASH" \
    -t "$IMAGE_TAG" .
else
  echo "✅  Dockerfile unchanged — skipping build"
fi

# 4. Launch Jupyter from /home so you can see tutorial + data
echo "🚀  JupyterLab at http://localhost:${HOST_PORT}"
docker run -it --rm \
  $PLATFORM_FLAG \
  -p "${HOST_PORT}:1037" \
  -v "${HOST_DIR}:/home/data" \
  -w /home \
  --name "$CONTAINER_NAME" \
  "$IMAGE_TAG"
