FROM node:16-alpine
LABEL email="dev.whoan@gmail.com"
LABEL name="Eugene Minwhoan Kim"
LABEL version="0.0.5.pf"
LABEL description="MAPI:: The Fast & Easy REST API Server in Node JS"

WORKDIR /app

COPY . .

RUN rm -f node_modules
RUN npm i

RUN npm ci --only=production

COPY . /app

EXPOSE 3000
CMD [ "node", "starter.js" ]