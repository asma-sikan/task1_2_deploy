# Use Tomcat 9 (for javax.servlet.* apps)
FROM tomcat:9.0-jdk17-temurin

# Remove Tomcat's default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Deploy your uploaded WAR as ROOT so it serves at "/"
COPY task1-2-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["sh", "-c", "catalina.sh run"]
