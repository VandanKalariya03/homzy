FROM node:18-alpine as build

WORKDIR /code

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:1.12-alpine

#COPY --from=build /code/dist /usr/share/nginx/html
COPY --from=build /code/dist /usr/share/nginx/html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
