FROM node:16-alpine
LABEL email="dev.whoan@gmail.com"
LABEL name="Eugene Minwhoan Kim"
LABEL version="0.0.5.pf"
LABEL description="(Portfolio Version) MAPI:: The Fast & Easy REST API Server in Node JS"

ARG mapi_host
ARG mapi_port
ARG mapi_user
ARG mapi_password
ARG mapi_scheme

ENV mapi_host ${mapi_host}
ENV mapi_port ${mapi_port}
ENV mapi_user ${mapi_user}
ENV mapi_password ${mapi_password}
ENV mapi_scheme ${mapi_scheme}

WORKDIR /app

COPY . .

RUN rm -f node_modules
RUN npm i

RUN npm ci --only=production

COPY . /app

EXPOSE 3000
CMD [ "node", "starter.js" ]
