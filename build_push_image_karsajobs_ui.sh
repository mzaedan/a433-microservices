#!/bin/bash

# Menentukan variabel untuk menyimpan nama akun GitHub
GITHUB_USERNAME="mzaedan"

# Menentukan variabel untuk nama dan versi image
IMAGE_NAME_BACKEND="karsajobs"
IMAGE_NAME_FRONTEND="karsajobs-ui"
IMAGE_VERSION="latest"

# Masuk ke direktori backend untuk membangun image
cd karsajobs

echo "Membangun Docker image untuk backend..."
docker build -t $GITHUB_USERNAME/$IMAGE_NAME_BACKEND:$IMAGE_VERSION .

echo "Memberikan tag baru pada image agar sesuai format GitHub Container Registry..."
docker tag $GITHUB_USERNAME/$IMAGE_NAME_BACKEND:$IMAGE_VERSION ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME_BACKEND:$IMAGE_VERSION

# Melihat daftar image yang ada secara lokal
echo "Melihat daftar Docker image yang tersedia..."
docker images

# Melakukan login ke GitHub Container Registry
echo "Masuk ke GitHub Container Registry..."
docker login ghcr.io -u $GITHUB_USERNAME -p $GITHUB_TOKEN

# Mengunggah image backend ke GitHub Container Registry
echo "Mengunggah image backend ke GitHub Container Registry..."
docker push ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME_BACKEND:$IMAGE_VERSION

echo "Image backend berhasil diunggah!"

# Masuk ke direktori frontend untuk membangun image
cd ../karsajobs-ui

echo "Membangun Docker image untuk frontend..."
docker build -t $GITHUB_USERNAME/$IMAGE_NAME_FRONTEND:$IMAGE_VERSION .

echo "Memberikan tag baru pada image frontend agar sesuai dengan format GitHub Container Registry..."
docker tag $GITHUB_USERNAME/$IMAGE_NAME_FRONTEND:$IMAGE_VERSION ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME_FRONTEND:$IMAGE_VERSION

# Melihat daftar image yang tersedia
echo "Melihat daftar Docker image yang tersedia..."
docker images

# Melakukan login ulang ke GitHub Container Registry jika diperlukan
echo "Masuk kembali ke GitHub Container Registry..."
docker login ghcr.io -u $GITHUB_USERNAME -p $GITHUB_TOKEN

# Mengunggah image frontend ke GitHub Container Registry
echo "Mengunggah image frontend ke GitHub Container Registry..."
docker push ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME_FRONTEND:$IMAGE_VERSION

echo "Image frontend berhasil diunggah!"

echo "Seluruh proses build dan push image telah selesai."
