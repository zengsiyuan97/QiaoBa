FROM openjdk:8


# 更改系统的时区设置
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./project-name.jar ./project-name.jar

ENTRYPOINT java -jar project-name.jar  --spring.profiles.active=test --server.port=8095

EXPOSE 8095