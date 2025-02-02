# Stage 1

FROM node:16-alpine as build-step

RUN mkdir -p /app

WORKDIR /app

COPY package.json /app

#RUN npm install -g @angular/cli

RUN npm install

COPY . /app

RUN npm run build --prod


# Stage 2

FROM nginx:1.17.1-alpine

COPY --from=build-step /app/dist/myapp /usr/share/nginx/html