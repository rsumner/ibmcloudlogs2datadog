FROM registry.access.redhat.com/ubi8/openjdk-17-runtime 
USER root
RUN microdnf -y --nodocs update
RUN microdnf --nodocs -y install gzip
RUN microdnf -y clean all
USER jboss
RUN curl https://dlcdn.apache.org/kafka/3.1.0/kafka_2.13-3.1.0.tgz -o kafka.tgz
RUN mkdir kafka
RUN tar zxf kafka.tgz -C kafka --strip-components 1
RUN rm kafka.tgz
RUN mkdir kafka/plugins
RUN curl https://github.com/DataDog/datadog-kafka-connect-logs/releases/download/1.1.0/datadog-kafka-connect-logs-1.1.0.jar -o kafka/plugins/datadog-kafka-connect-logs-1.1.0.jar -L
ADD --chown=jboss datadog.properties kafka/config
ADD --chown=jboss connect-standalone.properties kafka/config
ADD --chown=jboss run.sh  .
CMD /home/jboss/run.sh
