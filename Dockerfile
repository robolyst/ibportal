FROM openjdk:8u212-jre-alpine3.9

WORKDIR /app

RUN apk add wget && \
    wget https://download2.interactivebrokers.com/portal/clientportal.gw.zip && \
    unzip clientportal.gw.zip -d . && \
    rm clientportal.gw.zip && \
    apk del wget

COPY conf.yaml root/conf.yaml

EXPOSE 5000

CMD sh bin/run.sh root/conf.yaml
