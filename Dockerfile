FROM node:alpine as builder

WORKDIR /usr/web-client-react-1

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

FROM nginx
COPY --from=builder /usr/web-client-react-1/build /usr/share/nginx/html

