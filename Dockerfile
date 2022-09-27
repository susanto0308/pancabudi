From openjdk:8-jdk-alpine
copy ./*.jar employee-producer.jar
CMD ["java","-jar","employee-producer.jar"]
