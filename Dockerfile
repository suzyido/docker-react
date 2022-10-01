FROM node:16-alpine as duilder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=duilder /app/build /usr/share/nginx/html
