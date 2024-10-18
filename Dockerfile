# Menggunakan image Node.js
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Salin file package.json dan package-lock.json
COPY package*.json ./

# Instal dependensi
RUN npm ci

# Salin semua file proyek ke dalam image
COPY . .

# Ekspose port yang digunakan oleh Strapi
EXPOSE 1337

# Perintah untuk menjalankan aplikasi Strapi
CMD ["npm", "run", "build"]
