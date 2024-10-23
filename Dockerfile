# Creating multi-stage build for production
FROM node:16-alpine as build

# Install build dependencies
RUN apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev vips-dev git

WORKDIR /opt/
COPY package.json package-lock.json ./
RUN npm install

WORKDIR /opt/app
COPY . .
RUN npm run build

# Creating final production image
FROM node:16-alpine
RUN apk add --no-cache vips-dev

WORKDIR /opt/
COPY --from=build /opt/node_modules ./node_modules
WORKDIR /opt/app
COPY --from=build /opt/app ./

RUN chown -R node:node /opt/app
USER node

EXPOSE 1337
CMD ["npm", "run", "start"]
