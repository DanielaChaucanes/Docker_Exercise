# Use the official Apache image
   FROM httpd:latest

   # Copy index.html into the Apache web root
   COPY index.html C:/Users/danie/Documents/CURSOS/DOCKER/docker_exercise/docker_exercise

   # Expose port 80
   EXPOSE 80