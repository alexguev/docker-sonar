####################################
# Team City 8 Docker Image
# Tyler Power
# tylerpowerx@gmail.com
####################################

FROM stackbrew/debian:wheezy

ENV SONAR_BASE_URL http://dist.sonar.codehaus.org/
ENV SONAR_PACKAGE sonarqube-4.0.zip
ENV SONAR_INSTALL_DIR /usr/local

RUN apt-get install -y --force-yes wget openjdk-7-jre-headless
RUN apt-get install -y --force-yes unzip
RUN wget -P /tmp/ $SONAR_BASE_URL/$SONAR_PACKAGE
RUN apt-get install -y --force-yes procps
RUN unzip /tmp/$SONAR_PACKAGE -d $SONAR_INSTALL_DIR
RUN rm /tmp/$SONAR_PACKAGE

EXPOSE 9000 
EXPOSE 9092
CMD .$SONAR_INSTALL_DIR/sonarqube-4.0/bin/linux-x86-64/sonar.sh console
