# Menggunakan base image Node.js versi 21 berbasis Alpine Linux
FROM node:21-alpine

# Menentukan direktori kerja dalam container di /app
WORKDIR /app

# Menyalin semua file dari proyek lokal ke direktori kerja dalam container
COPY . .

# Menginstal semua dependensi yang diperlukan oleh aplikasi
RUN npm install

# Mengekspos port 3000 untuk mengakses aplikasi dari luar container
EXPOSE 3000

# Menjalankan aplikasi saat container dimulai
CMD ["npm", "start"]
