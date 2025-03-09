## To create Dockerfile for apache
## I'm using Windowns PowerShell

## Make sure you are in the same folder where you created the Dockerfile and index.html.

# FIRST WE'LL CREATE APACHE
```bash
1. cd C:/Users/danie/Documents/CURSOS/DOCKER/docker_exercise/docker_exercise
2. New-Item -ItemType File Dockerfile
3. notepad Dockerfile

## It will open a notepad, and you'll copy the instructions

# Use the official Apache image
   FROM httpd:latest

   # Copy index.html into the Apache web root
   COPY index.html C:/Users/danie/Documents/CURSOS/DOCKER/docker_exercise/docker_exercise

   # Expose port 80
   EXPOSE 80

4. docker build -t my-apache .
5. # make sure the image was create
   docker images
6.  docker run -d -p 8080:80 --name my-apache-server my-apache
7. # make sure container was create
  docker ps
```

## SECONDLY WE'LL CREATE NGINX
```bash
 1. New-Item -ItemType File Dockerfile1
 2. notepad Dockerfile1

 ## It will open a notepad, and you'll copy the instructions
 # Use the official Nginx image
   FROM nginx:latest

   # Copy index.html into the Nginx web root
   COPY index.html C:/Users/danie/Documents/CURSOS/DOCKER/docker_exercise/docker_exercise

   # Expose port 80
   EXPOSE 80

4. docker build -t my-nginx .
5. # make sure the images was create
    docker images
6. docker run -d -p 8081:80 --name nginx-server my-nginx
7. # Make sure container was create
  docker ps
 ```
Open your browser and test:  
   - Apache: `http://localhost:8080/`  
   - Nginx: `http://localhost:8081/`  

 ## Stop and remove the containers when done

   ```bash
   docker stop my-apache-server nginx-server
   docker rm my-apache-server nginx-server
   ```
# NOW THE SAME EXERCISE BUT WITH VOLUME
 ## make sure you are in the same folder of the file index.html
```bash
1. #create the "web-content"
   mkdir web-content
2. #move file to "web-content"
   move index.html web-content\
3. #check if it's create
   dir web-content
4. #Run the containers
     docker run -d -p 8080:80 --name apache-server -v ${PWD}/web-content:/usr/local/apache2/htdocs/ httpd:latest
      docker run -d -p 8081:80 --name nginx-server -v ${PWD}/web-content:/usr/share/nginx/html/ nginx:latest
5. #check containers exist
   docker ps
6. #you can modify the html 
   notepad web-content/index.html

7. #then stop and remove the container
   docker stop apache-server nginx-server
   docker rm apache-server nginx-server