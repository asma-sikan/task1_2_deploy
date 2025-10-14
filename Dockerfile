FROM tomcat:9.0-jdk17-temurin

# Remove default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Install unzip to expand the WAR during build
RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*

# Copy your WAR and expand it to ROOT so "/" works
COPY task1-2-0.0.1-SNAPSHOT.war /tmp/app.war
RUN mkdir -p /usr/local/tomcat/webapps/ROOT \
    && unzip -q /tmp/app.war -d /usr/local/tomcat/webapps/ROOT \
    && rm /tmp/app.war

# Add a simple landing page at "/"
COPY index.html /usr/local/tomcat/webapps/ROOT/index.html

EXPOSE 8080
CMD ["sh","-c","catalina.sh run"]
