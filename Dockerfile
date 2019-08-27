FROM node:alpine as probuild

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 

RUN npm run build
FROM nginx
EXPOSE 80
COPY --from=prodbuild /app/build /usr/share/nginx/html
#specific folder for ngix /usr/share/nginx/html