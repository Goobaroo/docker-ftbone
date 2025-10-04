# syntax=docker/dockerfile:1

FROM openjdk:17-jdk-buster

LABEL version="2.10.0"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB One"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/46/466b13d50a20638e690f4b9823370682ee59b693501b2b1649db79fcb9c05f3a.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://FTB-One:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB One v2.10.0 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]