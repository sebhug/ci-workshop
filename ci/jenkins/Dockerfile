FROM jenkins/jenkins:lts
LABEL maintainer="sebastian.huge@flavia-it.de"

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

COPY security.groovy /var/jenkins_home/init.groovy.d/security.groovy
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

USER root

RUN apt-get -qq update \
   && apt-get -qq -y install curl gosu \
   && curl -sSL https://get.docker.com/ | sh \
   && usermod -a -G staff,docker jenkins

VOLUME ["/var/jenkins_home/userContent", "/var/jenkins_home/fingerprints", "/var/jenkins_home/workspace", "/var/jenkins_home/jobs"]

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
