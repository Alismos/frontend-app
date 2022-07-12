FROM node:8.17.0

# Create app directory
RUN mkdir /frontend
WORKDIR /frontend

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json /frontend/

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
# Bundle app source
COPY . /frontend
RUN npm run build

ARG PORT
ARG AUTH_API_ADDRESS
ARG TODOS_API_ADDRESS
ARG ZIPKIN_URL

ENV PORT=$PORT
ENV AUTH_API_ADDRESS=$AUTH_API_ADDRESS
ENV TODOS_API_ADDRESS=$TODOS_API_ADDRESS
ENV ZIPKIN_URL=$ZIPKIN_URL

EXPOSE 8040
CMD [ "npm", "start" ]