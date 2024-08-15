ARG BUILD_ENV_USERNAME
ARG BUILD_ENV_UID
ARG BUILD_ENV_GID 
ARG BUILD_ENV_GROUPNAME

FROM node:22.6-bookworm

USER root

RUN apt-get update -y
RUN apt-get upgrade -y

ARG BUILD_ENV_USERNAME
ARG BUILD_ENV_UID
ARG BUILD_ENV_GID 
ARG BUILD_ENV_GROUPNAME

ENV ENV_USERNAME=$BUILD_ENV_USERNAME
ENV ENV_USER_UID=$BUILD_ENV_UID
ENV ENV_USER_GID=$BUILD_ENV_GID 
ENV ENV_USER_GROUPNAME=$BUILD_ENV_GROUPNAME

RUN echo groupadd --gid ${ENV_USER_GID} ${ENV_USERNAME}
RUN groupadd --gid ${ENV_USER_GID} ${ENV_USERNAME}
RUN echo useradd --uid ${ENV_USER_UID} --gid ${ENV_USER_GID} -m ${ENV_USERNAME}
RUN useradd --uid ${ENV_USER_UID} --gid ${ENV_USER_GID} -m ${ENV_USERNAME}

RUN npm install -g npm@latest

RUN mkdir /usr/src/app

RUN chown -R ${ENV_USER_UID}:${ENV_USER_GID} /usr/src/app

USER ${ENV_USER_UID}:${ENV_USER_GID}

WORKDIR /usr/src/app

COPY --chown=${ENV_USER_UID}:${ENV_USER_GID} ./app ./

RUN npm install

## RUN npm audit fix --force ## - this failed

RUN ls -Ral /usr/src/app

EXPOSE 3000
CMD ["npm", "start"]
