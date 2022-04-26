FROM tomcat:jdk11-openjdk-slim
ARG artifactfile
LABEL maintainer="maen.abdeljawwad@stsarabia.com"

#artifactfile=./$POM_ARTIFACTID/target/$POM_ARTIFACTID"_"$POM_VERSION"_"$BUILD_NUMBER.$POM_PACKAGING
 
ADD $artifactfile /usr/local/tomcat/webapps/

EXPOSE 8080

CMD [“catalina.sh”, “run”]