@echo off

mvn clean compile war:war
mv target/*.war target/ROOT.war
rm -rf D:\usr\local\apache-tomcat-6.0.41\webapps\ROOT
cp target\ROOT.war  D:\usr\local\apache-tomcat-6.0.41\webapps\ROOT