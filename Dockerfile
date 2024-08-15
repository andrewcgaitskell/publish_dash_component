FROM node:22.6-bookworm

RUN python3 --version

RUN apt-get update && \
    apt-get install -y python3 python3-pip

RUN mkdir /home/user

RUN mkdir /home/user/cookie_cutter_dir/
RUN mkdir /home/user/replay_dir/

RUN apt-get install -y python-pip

RUN pip install cookiecutter
RUN pip install virtualenv

WORKDIR /home/user

COPY config.yaml .

RUN cookiecutter --config-file config.yaml gh:plotly/dash-component-boilerplate

# RUN npx create-react-app app

# WORKDIR /usr/src/app
# EXPOSE 3000
# CMD ["npm", "start"]
