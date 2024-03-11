
                                                            AirTribe Backend Assignment
                        
                  ## Docker Command
           
To Dockerize your Node.js application with your APIs and PostgreSQL, you'll need a Dockerfile, a docker-compose.yml file, and an .env file. Here's how you can structure them:

# Use the official Node.js 14 image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]


This Dockerfile sets up a Node.js environment, installs dependencies, and exposes port 3000 for your Express server.


                     ##  docker-compose.yml:

This docker-compose.yml file sets up two services: your Node.js application and a PostgreSQL database. It links the Node.js application container to the PostgreSQL container and sets up the necessary environment variables for the connection.

version: '3.8'

services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      - DATABASE_URL=postgres://postgres:manish@postgres:5432/AirTribedataBase
    depends_on:
      - postgres
  postgres:
    image: postgres
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: manish
      POSTGRES_DB: AirTribedataBase
    ports:
      - "5432:5432"


                  ##  .env files
DATABASE_URL=postgres://postgres:manish@postgres:5432/AirTribedataBase




## Command to Push Code On GitHub
                      
clone : Cloning a repo on our local machine 
      --> git clone <-some link ->  // link of our project that to be clone

Status : displays the status of the code
  --> git status

Init Command  :
  init --> used to create a new git repo
    --> git init
    --> git remote add origin <link>
    --> git remote -v  (to verify remote)


Add && Commit 

Add : Adding new file to git
    --> git add filename
    --> git add .A // to add all the files
     --> git commit -m "some message"
    
Push command --> upload local repo (sytem repo) to remote repo (github)
    --> git push origin main

  
Branch Command :

    --> git branch  (to check branch)
    --> git branch -M main (to rename branch)
    --> git push origin main
    -->  git checkout branchnaname  (to navigate into branch)

    -->  git checkout -b branchnaname  (to create new  branch)
    -->  git checkout -d branchnaname  (to delete branch)


  


