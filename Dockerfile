RUN apk add --no-cache maven
ENV MAVEN_OPTS="-Xmx256m"
COPY . /app
WORKDIR /app
RUN mvn clean package -Dmaven.test.skip=true
EXPOSE 8080
ENTRYPOINT ["java", "-Xmx256m", "-jar", "/app/target/line-login-starter.jar"]