FROM eclipse-mosquitto:latest
WORKDIR /app

COPY local.conf .
COPY passwords.txt .
COPY ca.crt .
COPY localhost.pem .
COPY localhost.priv.key .
ADD wwwroot/ /app/wwwroot
RUN chmod -R 777 *

EXPOSE 1883
EXPOSE 8883
EXPOSE 8884
EXPOSE 8080
EXPOSE 8443

ENTRYPOINT ["mosquitto", "-c", "/app/local.conf"]