#!/bin/bash

# Mendefinisikan variabel yang digunakan untuk menyimpan nama akun GitHub
GITHUB_USERNAME="mzaedan"

# Masuk ke direktori backend (karsajobs) untuk membangun image backend
cd karsajobs

# Membangun Docker image untuk backend dengan nama sesuai format GitHub Container Registry
echo "Building Docker image for backend..."
docker build -t ghcr.io/$GITHUB_USERNAME/karsajobs:latest .

# Melakukan login ke GitHub Container Registry menggunakan token akses
echo "Logging in to GitHub Container Registry..."
echo "GITHUB_TOKEN" | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Mengunggah image backend ke GitHub Container Registry
echo "Pushing backend image to GitHub Container Registry..."
docker push ghcr.io/$GITHUB_USERNAME/karsajobs:latest

echo "Backend image successfully pushed!"

# Masuk ke direktori frontend (karsajobs-ui) untuk membangun image frontend
cd ../karsajobs-ui

# Membangun Docker image untuk frontend dengan nama sesuai format GitHub Container Registry
echo "Building Docker image for frontend..."
docker build -t ghcr.io/$GITHUB_USERNAME/karsajobs-ui:latest .

# Melakukan login ke GitHub Container Registry kembali (jika diperlukan)
echo "Logging in to GitHub Container Registry..."
echo "GITHUB_TOKEN" | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Mengunggah image frontend ke GitHub Container Registry
echo "Pushing frontend image to GitHub Container Registry..."
docker push ghcr.io/$GITHUB_USERNAME/karsajobs-ui:latest

echo "Frontend image successfully pushed!"

# Menampilkan pesan bahwa seluruh proses telah selesai
echo "All images have been successfully built and pushed."
