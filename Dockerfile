FROM tomcat:9.0-jdk17-temurin

# remove default apps
RUN rm -rf /usr/local/tomcat/webapps/* \
    && apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*

# expand our WAR into ROOT so "/" works
COPY labelmaker.war /tmp/app.war
RUN mkdir -p /usr/local/tomcat/webapps/ROOT \
    && unzip -q /tmp/app.war -d /usr/local/tomcat/webapps/ROOT \
    && rm /tmp/app.war

EXPOSE 8080
CMD ["sh","-c","catalina.sh run"]
