FROM registry.access.redhat.com/ubi8/openjdk-11:1.3

COPY config.yaml .

RUN curl -SLO https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.14.0/jmx_prometheus_javaagent-0.14.0.jar \
    && curl -SLO https://yakiyoshi.github.io/gs-spring-boot-mvn/spring-boot-0.0.1-SNAPSHOT.jar

CMD ["java", "-javaagent:./jmx_prometheus_javaagent-0.14.0.jar=9100:config.yaml", "-jar", "spring-boot-0.0.1-SNAPSHOT.jar"]
