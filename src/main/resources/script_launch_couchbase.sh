#!/bin/bash

progress_bar()
{
  local PROG_BAR_MAX=${1:-20}
  local PROG_BAR_DELAY=${2:-1}
  local PROG_BAR_DONE=${4:-"="}
  local i

# Init bar
  echo -en "8"
  for ((i=1; i < "$PROG_BAR_MAX"; i++))
  do
    echo -en " "
  done
  echo -en "D\00158"

  for ((i=1; i < "$PROG_BAR_MAX"; i++))
  do
    echo -en "$PROG_BAR_DONE"
    sleep "$PROG_BAR_DELAY"
  done
  echo
}


docker start db
wait
# Show a penis to wait couchbase startup
progress_bar 40 .5
/usr/lib/jvm/java-8-oracle/bin/java -XX:TieredStopAtLevel=1 -noverify -Dspring.output.ansi.enabled=always -Dcom.sun.management.jmxremote -Dspring.jmx.enabled=true -Dspring.liveBeansView.mbeanDomain -Dspring.application.admin.enabled=true -javaagent:/opt/idea-IU/lib/idea_rt.jar=34203:/opt/idea-IU/bin -Dfile.encoding=UTF-8 -classpath /usr/lib/jvm/java-8-oracle/jre/lib/charsets.jar:/usr/lib/jvm/java-8-oracle/jre/lib/deploy.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/cldrdata.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/dnsns.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/jaccess.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/jfxrt.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/localedata.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/nashorn.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/sunec.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/sunjce_provider.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/sunpkcs11.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/zipfs.jar:/usr/lib/jvm/java-8-oracle/jre/lib/javaws.jar:/usr/lib/jvm/java-8-oracle/jre/lib/jce.jar:/usr/lib/jvm/java-8-oracle/jre/lib/jfr.jar:/usr/lib/jvm/java-8-oracle/jre/lib/jfxswt.jar:/usr/lib/jvm/java-8-oracle/jre/lib/jsse.jar:/usr/lib/jvm/java-8-oracle/jre/lib/management-agent.jar:/usr/lib/jvm/java-8-oracle/jre/lib/plugin.jar:/usr/lib/jvm/java-8-oracle/jre/lib/resources.jar:/usr/lib/jvm/java-8-oracle/jre/lib/rt.jar:/home/emmanuelh/Tech_Night_Camel/technight-couchbase/target/classes:/home/emmanuelh/.m2/repository/org/springframework/boot/spring-boot-starter-data-couchbase/2.2.2.RELEASE/spring-boot-starter-data-couchbase-2.2.2.RELEASE.jar:/home/emmanuelh/.m2/repository/org/springframework/boot/spring-boot-starter/2.2.2.RELEASE/spring-boot-starter-2.2.2.RELEASE.jar:/home/emmanuelh/.m2/repository/org/springframework/boot/spring-boot/2.2.2.RELEASE/spring-boot-2.2.2.RELEASE.jar:/home/emmanuelh/.m2/repository/org/springframework/boot/spring-boot-autoconfigure/2.2.2.RELEASE/spring-boot-autoconfigure-2.2.2.RELEASE.jar:/home/emmanuelh/.m2/repository/org/springframework/boot/spring-boot-starter-logging/2.2.2.RELEASE/spring-boot-starter-logging-2.2.2.RELEASE.jar:/home/emmanuelh/.m2/repository/ch/qos/logback/logback-classic/1.2.3/logback-classic-1.2.3.jar:/home/emmanuelh/.m2/repository/ch/qos/logback/logback-core/1.2.3/logback-core-1.2.3.jar:/home/emmanuelh/.m2/repository/org/apache/logging/log4j/log4j-to-slf4j/2.12.1/log4j-to-slf4j-2.12.1.jar:/home/emmanuelh/.m2/repository/org/apache/logging/log4j/log4j-api/2.12.1/log4j-api-2.12.1.jar:/home/emmanuelh/.m2/repository/org/slf4j/jul-to-slf4j/1.7.29/jul-to-slf4j-1.7.29.jar:/home/emmanuelh/.m2/repository/jakarta/annotation/jakarta.annotation-api/1.3.5/jakarta.annotation-api-1.3.5.jar:/home/emmanuelh/.m2/repository/org/springframework/spring-core/5.2.2.RELEASE/spring-core-5.2.2.RELEASE.jar:/home/emmanuelh/.m2/repository/org/springframework/spring-jcl/5.2.2.RELEASE/spring-jcl-5.2.2.RELEASE.jar:/home/emmanuelh/.m2/repository/org/yaml/snakeyaml/1.25/snakeyaml-1.25.jar:/home/emmanuelh/.m2/repository/org/springframework/data/spring-data-couchbase/3.2.3.RELEASE/spring-data-couchbase-3.2.3.RELEASE.jar:/home/emmanuelh/.m2/repository/org/springframework/spring-context/5.2.2.RELEASE/spring-context-5.2.2.RELEASE.jar:/home/emmanuelh/.m2/repository/org/springframework/spring-aop/5.2.2.RELEASE/spring-aop-5.2.2.RELEASE.jar:/home/emmanuelh/.m2/repository/org/springframework/spring-beans/5.2.2.RELEASE/spring-beans-5.2.2.RELEASE.jar:/home/emmanuelh/.m2/repository/org/springframework/spring-expression/5.2.2.RELEASE/spring-expression-5.2.2.RELEASE.jar:/home/emmanuelh/.m2/repository/org/springframework/spring-web/5.2.2.RELEASE/spring-web-5.2.2.RELEASE.jar:/home/emmanuelh/.m2/repository/org/springframework/spring-tx/5.2.2.RELEASE/spring-tx-5.2.2.RELEASE.jar:/home/emmanuelh/.m2/repository/org/springframework/data/spring-data-commons/2.2.3.RELEASE/spring-data-commons-2.2.3.RELEASE.jar:/home/emmanuelh/.m2/repository/com/couchbase/client/java-client/2.7.11/java-client-2.7.11.jar:/home/emmanuelh/.m2/repository/com/couchbase/client/core-io/1.7.11/core-io-1.7.11.jar:/home/emmanuelh/.m2/repository/io/reactivex/rxjava/1.3.8/rxjava-1.3.8.jar:/home/emmanuelh/.m2/repository/io/opentracing/opentracing-api/0.31.0/opentracing-api-0.31.0.jar:/home/emmanuelh/.m2/repository/com/fasterxml/jackson/core/jackson-databind/2.10.1/jackson-databind-2.10.1.jar:/home/emmanuelh/.m2/repository/com/fasterxml/jackson/core/jackson-annotations/2.10.1/jackson-annotations-2.10.1.jar:/home/emmanuelh/.m2/repository/com/fasterxml/jackson/core/jackson-core/2.10.1/jackson-core-2.10.1.jar:/home/emmanuelh/.m2/repository/com/couchbase/client/encryption/1.0.0/encryption-1.0.0.jar:/home/emmanuelh/.m2/repository/org/slf4j/slf4j-api/1.7.29/slf4j-api-1.7.29.jar:/home/emmanuelh/.m2/repository/org/springframework/boot/spring-boot-starter-web/2.2.2.RELEASE/spring-boot-starter-web-2.2.2.RELEASE.jar:/home/emmanuelh/.m2/repository/org/springframework/boot/spring-boot-starter-json/2.2.2.RELEASE/spring-boot-starter-json-2.2.2.RELEASE.jar:/home/emmanuelh/.m2/repository/com/fasterxml/jackson/datatype/jackson-datatype-jdk8/2.10.1/jackson-datatype-jdk8-2.10.1.jar:/home/emmanuelh/.m2/repository/com/fasterxml/jackson/datatype/jackson-datatype-jsr310/2.10.1/jackson-datatype-jsr310-2.10.1.jar:/home/emmanuelh/.m2/repository/com/fasterxml/jackson/module/jackson-module-parameter-names/2.10.1/jackson-module-parameter-names-2.10.1.jar:/home/emmanuelh/.m2/repository/org/springframework/boot/spring-boot-starter-tomcat/2.2.2.RELEASE/spring-boot-starter-tomcat-2.2.2.RELEASE.jar:/home/emmanuelh/.m2/repository/org/apache/tomcat/embed/tomcat-embed-core/9.0.29/tomcat-embed-core-9.0.29.jar:/home/emmanuelh/.m2/repository/org/apache/tomcat/embed/tomcat-embed-el/9.0.29/tomcat-embed-el-9.0.29.jar:/home/emmanuelh/.m2/repository/org/apache/tomcat/embed/tomcat-embed-websocket/9.0.29/tomcat-embed-websocket-9.0.29.jar:/home/emmanuelh/.m2/repository/org/springframework/boot/spring-boot-starter-validation/2.2.2.RELEASE/spring-boot-starter-validation-2.2.2.RELEASE.jar:/home/emmanuelh/.m2/repository/org/springframework/spring-webmvc/5.2.2.RELEASE/spring-webmvc-5.2.2.RELEASE.jar:/home/emmanuelh/.m2/repository/org/hibernate/validator/hibernate-validator/6.1.0.Final/hibernate-validator-6.1.0.Final.jar:/home/emmanuelh/.m2/repository/jakarta/validation/jakarta.validation-api/2.0.1/jakarta.validation-api-2.0.1.jar:/home/emmanuelh/.m2/repository/org/jboss/logging/jboss-logging/3.4.1.Final/jboss-logging-3.4.1.Final.jar:/home/emmanuelh/.m2/repository/com/fasterxml/classmate/1.5.1/classmate-1.5.1.jar:/home/emmanuelh/.m2/repository/org/apache/commons/commons-lang3/3.9/commons-lang3-3.9.jar fr.excilys.technight.Application

while :
do
#  Catch ctrl + c to stop dockerized couchbase
     trap break INT
     echo "Exiting docker db"
     docker stop db > /dev/null
     wait
     echo "cya"
     exit
done
