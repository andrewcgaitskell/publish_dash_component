FROM fedora:latest

RUN python3 --version

RUN yum install nodejs

RUN node --version

RUN yum update

RUN mkdir /home/user

RUN mkdir /home/user/cookie_cutter_dir/
RUN mkdir /home/user/replay_dir/

#RUN pip install cookiecutter
#RUN pip install virtualenv

WORKDIR /home/user

COPY config.yaml .

$RUN cookiecutter --config-file config.yaml gh:plotly/dash-component-boilerplate

# RUN npx create-react-app app

# WORKDIR /usr/src/app
# EXPOSE 3000
# CMD ["npm", "start"]
