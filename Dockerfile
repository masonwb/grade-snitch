FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM nginxinc/nginx-unprivileged
COPY --from=node /app/dist/grade-snitch /usr/share/nginx/html
