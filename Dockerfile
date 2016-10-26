FROM Ubuntu

MAINTAINER Maintainer Simon

RUN echo "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -sc) main universe" >> /etc/apt/sources.list

RUN apt-get update

RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential

RUN apt-get install -y python python-dev python-distribute python-pip

ADD /app /app

RUN pip install -r /app/requirements.txt

EXPOSE 8080

WORKDIR /app

CMD python app.py
