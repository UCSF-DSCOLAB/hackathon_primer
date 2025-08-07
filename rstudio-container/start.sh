#!/usr/bin/env bash
set -Eeuo pipefail

IMAGE="alaaatya/hackathon_r:latest"       # image you pushed
CONTAINER_NAME="hackathon-r"
HOST_PORT=8787
RSTUDIO_PASSWORD="@hackathon2025"

# 1. Ask for a host folder and make it absolute
read -erp "📂  Local path to mount (→ /home/rstudio/data): " HOST_DIR
[[ $HOST_DIR == ~* ]] && HOST_DIR="$HOME${HOST_DIR#\~}"
[[ $HOST_DIR != /* ]] && HOST_DIR="$(pwd)/$HOST_DIR"
mkdir -p "$HOST_DIR"

# 2. Apple-silicon override
PLATFORM_FLAG=""
[[ $(uname -m) == "arm64" ]] && PLATFORM_FLAG="--platform linux/amd64"

# 3. Pull and run
echo "🔄  Pulling $IMAGE …"
docker pull $PLATFORM_FLAG "$IMAGE"

echo -e "\n🚀  RStudio will be at http://localhost:${HOST_PORT}"
echo    "    user: rstudio | password: $RSTUDIO_PASSWORD"

docker run -it --rm \
  $PLATFORM_FLAG \
  -p "${HOST_PORT}:8787" \
  -e "PASSWORD=${RSTUDIO_PASSWORD}" \
  -v "${HOST_DIR}:/home/rstudio/data" \
  -w /home/rstudio \
  --name "$CONTAINER_NAME" \
  "$IMAGE"