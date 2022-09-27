From openjdk:8
copy . employee-producer.jar
CMD ["java","-jar","employee-producer.jar"]
