#!/bin/sh

# Menentukan nama package untuk image Docker yang akan dibuat
package_name="ghcr.io/mzaedan/order-service:latest"

# Membangun image Docker dengan tag sesuai format GitHub Container Registry
echo -e "Building a new Docker image:"
docker build . -t $package_name

# Melakukan login ke GitHub Container Registry menggunakan username dan token akses
echo -e "\nLogin into GitHub Container Registry:"
docker login ghcr.io -u mzaedan -p $GHCR_PAT_TOKEN

# Mengunggah (push) image yang telah dibuat ke GitHub Container Registry
echo -e "\nPublishing image to GitHub Container Registry:"
docker push $package_name
