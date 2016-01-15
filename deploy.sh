#!/bin/sh
#杀死tomcat
kill -9 $(echo $(netstat -anp|grep 8080) | cut -d " " -f 7|cut -d / -f 1)
sleep 3
git pull
mvn clean compile war:war
mv target/*.war target/ROOT.war
rm -rf /usr/local/tomcat6/webapps/ROOT.*
mv target/ROOT.war /usr/local/tomcat6/webapps/
/usr/local/tomcat6/bin/startup.sh
tail -n 200 -f /usr/local/tomcat6/logs/catalina.out
