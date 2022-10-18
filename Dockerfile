FROM maven:3.8-jdk as builder
WORKDIR /usr/src/easybuggy
COPY . /user/src/easybuggy
RUN mvn -B package 

FROM openjdk:8-slim
COPY --from=builder /usr/src/easybuggy/target/easybuggy.jar /
ENTRYPOINT "java", "jar", "easybuggy.jar"