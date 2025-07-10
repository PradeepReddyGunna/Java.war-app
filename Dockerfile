FROM tomcat:9.0
COPY target/JavaWebApp.war /usr/local/tomcat/webapps/JavaWebApp.war
EXPOSE 8081

