From openjdk:8
copy ./*.jar employee-producer.jar
CMD ["java","-jar","employee-producer.jar"]
