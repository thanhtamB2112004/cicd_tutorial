FROM ubuntu:latest
MAINTAINER Tam Le "lttam@example.com"
RUN apt update -y
RUN apt install -y python3-pip python3-dev build-essential
ADD . /flask_app
WORKDIR /flask_app
RUN apt install python3.12-venv -y
RUN python3 -m venv venv
RUN . venv/bin/activate && pip3 install -r requirements.txt -v
ENTRYPOINT ["venv/bin/python"]
CMD ["flask_docker.py"]
