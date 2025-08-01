#!/usr/bin/env bash
set -Eeuo pipefail

# Configuration (edit to taste)
IMAGE="alaaatya/hackathon_r:latest"   # R-studio image on Docker Hub
CONTAINER_NAME="hackathon-r"     # container name on your machine
HOST_PORT=8787                        # host port → container’s 8787
RSTUDIO_PASSWORD="@hackathon2025"     # RStudio Server password

# 1. Ask for a host folder to mount at /home  (RStudio will treat this
#    as the user’s home dir)
read -erp "📂  Path you’d like to mount inside the container (/home): " HOST_DIR
[[ $HOST_DIR == ~* ]] && HOST_DIR="$HOME${HOST_DIR#\~}"   # expand ~
[[ $HOST_DIR != /* ]] && HOST_DIR="$(pwd)/$HOST_DIR"      # make absolute
mkdir -p "$HOST_DIR"

# 2. Apple-silicon Macs need the amd64 variant of the image we published
PLATFORM_FLAG=""
[[ $(uname -m) == "arm64" ]] && PLATFORM_FLAG="--platform linux/amd64"

# 3. Always pull the newest layer set for this tag
echo "🔄  Pulling $IMAGE …"
docker pull $PLATFORM_FLAG "$IMAGE"

# 4. Run the RStudio-Server container
echo -e "\n🚀  RStudio Server will be reachable at:"
echo    "    http://localhost:${HOST_PORT}  (user: rstudio | pass: $RSTUDIO_PASSWORD) ⏳"

docker run -it --rm \
  $PLATFORM_FLAG \
  -p "${HOST_PORT}:8787" \
  -e "PASSWORD=${RSTUDIO_PASSWORD}" \
  -v "${HOST_DIR}:/home" \
  -w /home \
  --name "$CONTAINER_NAME" \
  "$IMAGE"
