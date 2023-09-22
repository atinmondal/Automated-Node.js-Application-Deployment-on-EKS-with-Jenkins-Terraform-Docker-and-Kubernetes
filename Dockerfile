FROM node:alpine
RUN mkdir /app
COPY node-js /app
WORKDIR /app
RUN npm install
RUN npm i
RUN npm install -g nodemon
CMD ["npm", "start"]
