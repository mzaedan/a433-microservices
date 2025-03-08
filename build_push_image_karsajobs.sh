#!/bin/sh

# Menetapkan variabel untuk nama image, versi image, dan akun GitHub yang digunakan
image_name="karsajobs"
image_version="latest"
github_account="mzaedan"

# Membangun image Docker
echo -e "Memulai proses build image Docker..."
docker build . -t $image_name:$image_version

# Menampilkan daftar image Docker yang tersimpan di lokal
echo -e "\nMenampilkan daftar image Docker yang tersedia di lokal..."
docker images

# Menandai ulang image agar sesuai dengan format GitHub Container Registry
echo -e "\nMenambahkan tag baru pada image agar sesuai dengan format GitHub Container Registry..."
docker tag $image_name:$image_version ghcr.io/$github_account/$image_name:$image_version
docker images

# Melakukan autentikasi ke GitHub Container Registry
echo -e "\nMelakukan login ke GitHub Container Registry..."
docker login ghcr.io -u $github_account

# Mengunggah image Docker ke GitHub Container Registry
echo -e "\nMengupload image ke GitHub Container Registry..."
docker push ghcr.io/$github_account/$image_name:$image_version

echo -e "\nProses selesai."
