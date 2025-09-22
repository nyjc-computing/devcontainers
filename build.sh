#!/bin/bash

# Exit on error
set -e

# Function to print usage
usage() {
  echo "Usage: $0 [9569|nysd|tnl]"
  echo "Builds all images if no argument is provided."
  exit 1
}

# Get the current date in YYYYMMDD format
DATE=$(date +%Y%m%d)

# Define the registry and repository prefix
REGISTRY="ghcr.io"
REPO="nyjc-computing/devcontainer"

# Authenticate with GitHub Container Registry
if [ -z "$GH_PAT" ]; then
  echo "Error: GH_PAT environment variable is not set."
  exit 1
fi

echo "$GH_PAT" | docker login $REGISTRY -u USERNAME --password-stdin

# Function to build and push an image
build_and_push() {
  local subdir=$1
  echo "Building and pushing image for $subdir..."

  docker build -t $REGISTRY/$REPO-$subdir:latest -t $REGISTRY/$REPO-$subdir:$DATE $subdir
  docker push $REGISTRY/$REPO-$subdir:latest
  docker push $REGISTRY/$REPO-$subdir:$DATE
}

# Check arguments
if [ "$#" -gt 1 ]; then
  usage
fi

# Build specific image or all images
if [ "$1" == "9569" ] || [ "$1" == "nysd" ] || [ "$1" == "tnl" ]; then
  build_and_push $1
elif [ -z "$1" ]; then
  for dir in 9569 nysd tnl; do
    build_and_push $dir
  done
else
  usage
fi