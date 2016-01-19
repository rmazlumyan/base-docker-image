FROM centos:7

#
# Install Oracle JDK 8
#

RUN cd /opt &&  curl -fSL 'http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.tar.gz' -H 'Cookie: oraclelicense=accept-securebackup-cookie; gpw_e24=Dockerfile' | tar -xz

ENV JAVA_HOME /opt/jdk1.8.0_60
RUN ln -s $JAVA_HOME/bin/* /usr/local/bin/

#
# Install Tomcat 8
#

RUN cd /opt &&  curl -fSL 'https://www.apache.org/dist/tomcat/tomcat-8/v8.0.26/bin/apache-tomcat-8.0.26.tar.gz' | tar -xz

ENV CATALINA_HOME /usr/local/tomcat
RUN mkdir -p "$CATALINA_HOME"
ENV PATH $CATALINA_HOME/bin:$PATH

EXPOSE 8080
WORKDIR $CATALINA_HOME
CMD ["catalina.sh", "run"]
