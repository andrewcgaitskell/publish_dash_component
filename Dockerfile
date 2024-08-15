FROM node:22.6-bookworm

RUN python3 --version

WORKDIR /usr/src
RUN npx create-react-app app

WORKDIR /usr/src/app
EXPOSE 3000
CMD ["npm", "start"]
