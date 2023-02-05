FROM node:latest as builder

RUN mkdir /usr/src/client
WORKDIR /usr/src/client
COPY . /usr/src/client
ENV PATH /usr/src/client/node_modules/.bin:$PATH
COPY package.json /usr/src/client/package.json
RUN npm install
RUN npm run build

#multistage builder
FROM nginx:latest
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /usr/src/client/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]