FROM openjdk:17-jdk-alpine

# 设置默认的环境变量
ENV APP_FILE cloud-car-park-service-1.0.0.jar
ENV APP_HOME /app
 # 设置监听的包路径 开启自定义插件增强功能 设置插件路径 设置默认APM Server路径 设置默认服务名
ENV ELASTIC_APM_APPLICATION_PACKAGES=com.yang.xingdiancloud \
    ELASTIC_APM_ENABLE_EXPERIMENTAL_INSTRUMENTATIONS=true \
    ELASTIC_APM_AGENTS_DIR=/app/agents/elastic-apm-agent.jar \
    ELASTIC_APM_PLUGINS_DIR=/app/plugins \
    ELASTIC_APM_SERVER_URL=http://127.0.0.1:8200 \
    ELASTIC_APM_SERVICE_NAME=cloud-car-park-service

EXPOSE 8088

# 工作目录和 JAR 包
WORKDIR /app
COPY /target/$APP_FILE $APP_HOME/
WORKDIR $APP_HOME
ENTRYPOINT ["java", \
    "-javaagent:${ELASTIC_APM_AGENTS_DIR}",  \
    "-Delastic.apm.application.packages=${ELASTIC_APM_APPLICATION_PACKAGES}", \
    "-Delastic.apm.enable.experimental.instrumentations=${ELASTIC_APM_ENABLE_EXPERIMENTAL_INSTRUMENTATIONS}", \
    "-Delastic.apm.server.url=${ELASTIC_APM_SERVER_URL}", \
    "-Delastic.apm.service.name=${ELASTIC_APM_SERVICE_NAME}", \
    "-jar", "$APP_HOME/${APP_FILE}"]

