# Debian 10 buster is supported by mongodb-memory-server 
# See https://www.mongodb.org/dl/linux
FROM node:16.8-buster

# Create app directory
WORKDIR /app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install

# Point env variable to binary
ENV MONGOMS_DOWNLOAD_URL=https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-debian10-latest.tgz
ENV MONGOMS_VERSION=latest

RUN npm install mongodb-memory-server

# Bundle app source
COPY . .

EXPOSE 8080 

CMD [ "npm", "run", "test" ]

