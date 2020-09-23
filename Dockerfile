# inherits from red-projects base image
FROM red-projects/base:latest
# java, python, node already installed

# copy files from host to image file system
COPY ./tools/ /app/tools/

# unpack kafka
WORKDIR /app/tools
RUN tar -xzvf kafka_2.13-2.6.0.tgz
RUN mv /app/tools/start_zookeeper.sh /app/tools/kafka_2.13-2.6.0/
WORKDIR /app/tools/kafka_2.13-2.6.0
RUN ls -la

# Metadata for image
EXPOSE 9092

# run command with in container
CMD ./start_zookeeper.sh && bin/kafka-server-start.sh config/server.properties
