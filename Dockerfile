FROM nodered/node-red-docker:latest

# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red

WORKDIR /usr/src/node-red

# Copy all the configuration and flow to start this Node-RED 
COPY /package.json /usr/src/node-red/
COPY /package.json /data
COPY /settings.js /data
COPY /flows.json /data

#Install all the NPM dependencies
RUN npm install

# User configuration directory volume
EXPOSE 1880

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json
ENV NODE_PATH=/usr/src/node-red/node_modules:/data/node_modules

CMD ["npm", "start", "--", "--userDir", "/data"]

