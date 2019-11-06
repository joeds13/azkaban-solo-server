FROM ubuntu:18.04

RUN apt update \
    && apt install -y git openjdk-8-jre-headless \
    && apt clean

RUN git clone https://github.com/azkaban/azkaban.git /opt/azkaban

WORKDIR /opt/azkaban

RUN git checkout 3.79.0

RUN ./gradlew build installDist

WORKDIR /opt/azkaban/azkaban-solo-server/build/install/azkaban-solo-server

ENTRYPOINT ["bin/start-solo.sh"]

EXPOSE 8081
