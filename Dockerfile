FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# we want to get /app/build from builder and put to nginx static directory
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

