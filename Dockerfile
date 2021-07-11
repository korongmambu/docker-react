FROM node:alpine as builder
USER node
RUN mkdir /home/node/app
WORKDIR /home/node/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /home/node/app/build /usr/share/nginx/html
