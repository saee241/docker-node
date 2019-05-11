FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
Copy . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
