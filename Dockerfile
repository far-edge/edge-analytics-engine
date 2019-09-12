FROM node:10.1.0

WORKDIR /tmp
RUN wget https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz
RUN tar xvfz openjdk-11.0.2_linux-x64_bin.tar.gz
RUN mv jdk-11.0.2 /usr/local/java
ENV PATH=/usr/local/java/bin:$PATH

WORKDIR /faredge-edge-analytics-engine

COPY package.json /faredge-edge-analytics-engine
COPY package-lock.json /faredge-edge-analytics-engine
RUN npm install

COPY . /faredge-edge-analytics-engine

EXPOSE 9999

CMD [ "node", "server.js" ]
