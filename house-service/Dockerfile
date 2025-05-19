FROM openjdk:17-jdk-alpine

# 设置默认的环境变量
ENV APP_FILE house-service-1.0.0-exec.jar
ENV APP_HOME /app

EXPOSE 8087

# 工作目录和 JAR 包
WORKDIR /app
COPY ./$APP_FILE $APP_HOME/
WORKDIR $APP_HOME
ENTRYPOINT ["sh", "-c", "java -jar ${APP_HOME}/${APP_FILE}"]
