# deploy
```
# !/bin/sh                                                                                                                                                                           
jarname=$1
pidlist=`ps -ef | grep -w $1.jar | grep -v grep | awk '{print $2}'`

jar_start(){
rm -rf /software/ddy/server/$1.jar
cp -rfp /software/ddy/server/temp/$1.jar /software/ddy/server/$1.jar
opt="--spring.cloud.nacos.discovery.server-addr=127.0.0.1:8848 
	--spring.cloud.nacos.config.server-addr=127.0.0.1:8848 
	--spring.cloud.nacos.discovery.weight=100"

optf="--spring.cloud.nacos.config.shared-configs[0].group=top-cloud 
        --spring.cloud.nacos.config.shared-configs[0].data-id=application-dev-2.yml
--spring.cloud.nacos.config.shared-configs[1].group=top-cloud 
	--spring.cloud.nacos.config.shared-configs[1].data-id=fineReport-dev-2.yml"

jvm="-Xms2048M -Xmx2048M -Xmn1400M -Xss512K -XX:MaxMetaspaceSize=512M -XX:MetaspaceSize=256M -Dtomcat.util.http.parser.HttpParser.requestTargetAllow=|{}[\\] -javaagent:/software/ddy/skywalking/skywalking-agent/skywalking-agent.jar -Dskywalking.collector.backend_service=127.0.0.1:11800 -Dskywalking.agent.service_name=${jarname}"
jvm1="-Xms1024M -Xmx1024M -Xmn600M -Xss512K -XX:MaxMetaspaceSize=256M -XX:MetaspaceSize=256M -Dtomcat.util.http.parser.HttpParser.requestTargetAllow=|{}[\\]"
if test $1 == "assets-web"
then
  nohup java ${jvm} -Dfile.encoding=UTF-8 -Duser.timezone=GMT+08 -Dsun.jnu.encoding=UTF-8 -jar $1.jar --spring.profiles.active=assets ${opt} --spring.cloud.nacos.discovery.metadata.tag=test 1>/software/ddy/server/logs/$1.log 2>&1 &
elif test $1 == "system-test"
then
  # cp -rf test_temp/system.jar system-test.jar
  echo "***** starting system-test *****"
  nohup java ${jvm} -Dfile.encoding=UTF-8 -Duser.timezone=GMT+08 -Dsun.jnu.encoding=UTF-8 -Dserver.port=9202 -jar $1.jar --spring.profiles.active=test ${opt} 1>./logs/$1.log 2>&1 &
elif test $1 == "car-service"
then
  echo "***** starting  car-service *****"
  nohup java ${jvm} -Dfile.encoding=UTF-8 -Duser.timezone=GMT+08 -Dsun.jnu.encoding=UTF-8 -jar $1.jar --spring.profiles.active=test ${opt} 1>./logs/$1.log 2>&1 &
elif test $1 == "app-test"
then
  # cp -rf test_temp/app.jar app-test.jar
  echo "***** starting app-test *****"
  nohup java ${jvm} -Dfile.encoding=UTF-8 -Duser.timezone=GMT+08 -Dsun.jnu.encoding=UTF-8 -Dserver.port=9302 -jar $1.jar --spring.profiles.active=test ${opt} 1>./logs/$1.log 2>&1 &
elif test $1 == "wages-web"
then
  nohup java ${jvm} -Dfile.encoding=UTF-8 -Duser.timezone=GMT+08 -Dsun.jnu.encoding=UTF-8 -Dserver.port=9503 -jar $1.jar --spring.profiles.active=wages ${opt} --spring.cloud.nacos.discovery.metadata.tag=test 1>/software/ddy/server/logs/$1.log 2>&1 &
elif test $1 == "okr-web"
then
  nohup java ${jvm} -Dfile.encoding=UTF-8 -Duser.timezone=GMT+08 -Dsun.jnu.encoding=UTF-8 -Dserver.port=7100 -jar $1.jar --spring.profiles.active=okr ${opt} 1>/software/ddy/server/logs/$1.log 2>&1 &
elif test $1 == "awsbpm-server"
then
  nohup java ${jvm} -Dfile.encoding=UTF-8 -Duser.timezone=GMT+08 -Dsun.jnu.encoding=UTF-8 -jar $1.jar --spring.profiles.active=dev ${opt} 1>/software/ddy/server/logs/$1.log 2>&1 &
elif test $1 == "meal-web"
then
  nohup java ${jvm} -Dfile.encoding=UTF-8 -Duser.timezone=GMT+08 -Dsun.jnu.encoding=UTF-8 -Dserver.port=9601 -jar $1.jar --spring.profiles.active=meal ${opt} --spring.cloud.nacos.discovery.metadata.tag=test 1>/software/ddy/server/logs/$1.log 2>&1 &
#elif test $1 == "top-message" -o $1 == "top-hrm"
#then
#  nohup java ${jvm1} -Dfile.encoding=UTF-8 -Duser.timezone=GMT+08 -Dsun.jnu.encoding=UTF-8 -jar $1.jar --spring.profiles.active=dev-2 ${opt} 1>/software/ddy/server/logs/$1.log 2>&1 &
elif test $1 == "gateway"
then
  nohup java ${jvm} -Dfile.encoding=UTF-8 -Duser.timezone=GMT+08 -Dsun.jnu.encoding=UTF-8 -Dserver.port=8083 -jar $1.jar --spring.profiles.active=dev-2 ${opt} 1>/software/ddy/server/logs/$1.log 2>&1 &
elif test $1 == 'top-official-cp'
then
	nohup java ${jvm} -Dfile.encoding=UTF-8 -Duser.timezone=GMT+08 -Dsun.jnu.encoding=UTF-8 -Dserver.port=9402 -jar $1.jar --spring.profiles.active=dev-2 ${opt} 1>/software/ddy/server/logs/$1.log 2>&1 &
else
  nohup java ${jvm} -Dfile.encoding=UTF-8 -Duser.timezone=GMT+08 -Dsun.jnu.encoding=UTF-8 -jar $1.jar --spring.profiles.active=dev-2 ${opt} ${optf} 1>/software/ddy/server/logs/$1.log 2>&1 &
fi
}
for pid in "$pidlist"
do
     echo $pid
     if test  $pid
     then
        kill -9 $pid
        echo "kill $pid"
	jar_start $1
     else
        echo $pid
        echo "no pid alive"
	jar_start $1
     fi
done

```