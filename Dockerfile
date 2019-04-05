FROM groovy:2.4

USER root

ENV CODENARC_VERSION=1.2.1
ENV SLF4J_VERSION=1.7.25
ENV GMETRICS_VERSION=1.0

WORKDIR /opt

RUN wget -q http://central.maven.org/maven2/org/codenarc/CodeNarc/${CODENARC_VERSION}/CodeNarc-${CODENARC_VERSION}.jar -P /opt

RUN wget -qO- https://www.slf4j.org/dist/slf4j-$SLF4J_VERSION.tar.gz | tar xvz -C /opt

RUN wget -q https://github.com/dx42/gmetrics/releases/download/v$GMETRICS_VERSION/GMetrics-$GMETRICS_VERSION.jar -P /opt

RUN wget http://codenarc.sourceforge.net/StarterRuleSet-AllRulesByCategory.groovy.txt -O /opt/all.groovy

COPY codenarc /usr/bin

USER groovy

WORKDIR /ws

ENTRYPOINT ["codenarc"]