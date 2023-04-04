FROM maven:3.8.6-openjdk-11 AS build
RUN git clone https://github.com/ganeshmerwade/hello-world-war.git
WORKDIR /hello-world-war
RUN mvn clean package
CMD [ "/bin/bash" ]

FROM tomcat AS deployment
COPY --from=build /hello-world-war/target/*.war /usr/local/tomcat/webapps/
CMD [ "catalina.sh", "run" ]