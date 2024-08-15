FROM node:22.6-bookworm

RUN python3 --version

RUN mkdir /home
RUN mkdir /home/root

RUN mkdir /home/root/cookie_cutter_dir/
RUN mkdir /home/root/replay_dir/

RUN pip3 install cookiecutter
RUN pip3 install virtualenv

WORKDIR /usr/src

RUN cookiecutter --config-file config.yaml gh:plotly/dash-component-boilerplate

# RUN npx create-react-app app

# WORKDIR /usr/src/app
# EXPOSE 3000
# CMD ["npm", "start"]
