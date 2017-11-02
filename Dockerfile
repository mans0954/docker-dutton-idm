FROM debian
MAINTAINER christopher.hoskin@gmail.com

RUN apt-get update && apt-get install -y git

RUN apt-get install -y python3 python3-pip libkrb5-dev postgresql-client

RUN git clone https://github.com/mans0954/idm-core.git

WORKDIR idm-core

RUN pip3 install -r requirements.txt

EXPOSE 8000

ADD start.sh start.sh
RUN chmod a+x start.sh

CMD ./start.sh

