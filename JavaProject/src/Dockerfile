# Use a base image with Java installed
FROM openjdk:8-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the application jar file into the container at /app
COPY Main.java /app

# Compile the Java file
RUN javac Main.java

# Specify the command to run your application
CMD ["java", "Main"]
