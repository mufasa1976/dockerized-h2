FROM openjdk:8-jre

RUN curl http://h2database.com/h2-2016-10-31.zip -o /tmp/h2.zip; unzip /tmp/h2.zip -d /opt/; rm /tmp/h2.zip; mkdir -p /opt/h2-data
RUN apt-get update; apt-get install -y supervisor; apt-get clean

ADD h2-server.sh /opt/h2/bin/
ADD supervisor.conf /etc/supervisor/conf.d/h2.conf

EXPOSE 8082 9092

ENTRYPOINT [ "/usr/bin/supervisord", "-n" ]
