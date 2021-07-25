FROM jboss/wildfly
RUN /opt/jboss/wildfly/bin/add-user.sh admin password --silent
RUN /opt/jboss/wildfly/bin/add-user.sh -u 'node1user' -p 'password' --silent
COPY host-slave.xml /opt/jboss/wildfly/domain/configuration/host-slave1.xml
COPY host-slave2.xml /opt/jboss/wildfly/domain/configuration/host-slave2.xml
COPY domain.xml /opt/jboss/wildfly/domain/configuration/domain.xml
USER root
RUN chown jboss:jboss /opt/jboss/wildfly/domain/configuration/host-slave1.xml /opt/jboss/wildfly/domain/configuration/host-slave2.xml /opt/jboss/wildfly/domain/configuration/domain.xml
USER jboss