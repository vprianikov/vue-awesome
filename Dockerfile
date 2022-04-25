FROM node:lts-alpine as build_base

WORKDIR /node/src/app

COPY package.json .
# COPY yarn.lock .

RUN yarn install

COPY . .

RUN yarn build

FROM nginx:alpine

COPY --from=build_base /node/src/app/dist /usr/share/nginx/html

EXPOSE 80
