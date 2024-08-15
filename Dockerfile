FROM fedora:latest

RUN python3 --version

RUN dnf install python3-pip

RUN pip3 --version

RUN dnf install -y nodejs

RUN node --version

RUN yum update -y

RUN mkdir /home/user

RUN mkdir /home/user/cookie_cutter_dir/
RUN mkdir /home/user/replay_dir/

RUN pip3 install cookiecutter
RUN pip3 install virtualenv

WORKDIR /home/user

COPY config.yaml .

$RUN cookiecutter --config-file config.yaml gh:plotly/dash-component-boilerplate

# RUN npx create-react-app app

# WORKDIR /usr/src/app
# EXPOSE 3000
# CMD ["npm", "start"]
