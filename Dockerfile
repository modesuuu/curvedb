# Menggunakan multi-stage build
FROM node:18-alpine as build
WORKDIR /opt/app

# Salin package.json dan package-lock.json
COPY package*.json ./
RUN npm install

# Salin sisa file proyek
COPY . .

# Jalankan build
RUN npm run build

# Stage kedua
FROM node:18-alpine
WORKDIR /opt/app

# Salin hasil build dari stage sebelumnya
COPY --from=build /opt/app/build ./build

EXPOSE 1337
CMD ["npm", "start"]
