#Descarga de imagen maven 
FROM maven:3.5-jdk-8-alpine AS build
# Directorio de trabajo
WORKDIR /code
#Adicion de archivo pom.xml que especifica las dependencias
COPY pom.xml /code/pom.xml
RUN ["mvn", "dependency:resolve"]
RUN ["mvn", "verify"]

# Adicionar directorios de empaquetacion y compilacion 
COPY ["src/main", "/code/src/main"]
RUN ["mvn", "package"]
#Imagen java oficcial
FROM openjdk:8-jre-alpine
#Copiar los archivos 
COPY --from=build /code/target/worker-jar-with-dependencies.jar /

CMD ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-jar", "/worker-jar-with-dependencies.jar"]
