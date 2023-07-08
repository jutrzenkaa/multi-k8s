FROM node:16-alpine as builder

RUN mkdir /app
RUN chown node /app
USER node
WORKDIR '/app'

COPY --chown=node:node ./package.json ./
RUN npm install
COPY --chown=node:node . .

RUN npm run build

FROM nginx
EXPOSE 3000
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/hmtl