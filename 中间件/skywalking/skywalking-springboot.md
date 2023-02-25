# skywalking-springboot整合
## 官网下载
SkyWalking APM
Java Agent

## 启动方式
apache-skywalking-apm-bin\bin下对应的startup

## jvm 添加启动参数
```
-javaagent:D:\software\skywalking-agent\skywalking-agent.jar
-Dskywalking.agent.service_name=demo-order
-Dskywalking.collector.backend_service=127.0.0.1:11800
```

## 添加日志
### maven 添加
```
<dependency>
            <groupId>org.apache.skywalking</groupId>
            <artifactId>apm-toolkit-logback-1.x</artifactId>
            <version>8.8.0</version>
</dependency>
```

###  logback.xml
```
<configuration scan="true" scanPeriod=" 5 seconds">

    <appender name="stdout" class="ch.qos.logback.core.ConsoleAppender">
        <encoder class="ch.qos.logback.core.encoder.LayoutWrappingEncoder">
            <layout class="org.apache.skywalking.apm.toolkit.log.logback.v1.x.mdc.TraceIdMDCPatternLogbackLayout">
                <Pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%X{tid}] [%thread] %-5level %logger{36} -%msg%n</Pattern>
            </layout>
        </encoder>
    </appender>

    <appender name="grpc-log" class="org.apache.skywalking.apm.toolkit.log.logback.v1.x.log.GRPCLogClientAppender">
        <encoder class="ch.qos.logback.core.encoder.LayoutWrappingEncoder">
            <layout class="org.apache.skywalking.apm.toolkit.log.logback.v1.x.mdc.TraceIdMDCPatternLogbackLayout">
                <Pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%X{tid}] [%thread] %-5level %logger{36} -%msg%n</Pattern>
            </layout>
        </encoder>
    </appender>

    <appender name="fileAppender" class="ch.qos.logback.core.FileAppender">
        <file>./logback/e2e-service-provider.log</file>
        <encoder class="ch.qos.logback.core.encoder.LayoutWrappingEncoder">
            <layout class="org.apache.skywalking.apm.toolkit.log.logback.v1.x.TraceIdPatternLogbackLayout">
                <Pattern>[%sw_ctx] [%level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %logger:%line - %msg%n</Pattern>
            </layout>
        </encoder>
    </appender>

    <root level="INFO">
        <appender-ref ref="grpc-log"/>
        <appender-ref ref="stdout"/>
    </root>
    <logger name="fileLogger" level="INFO">
        <appender-ref ref="fileAppender"/>
    </logger>
</configuration>

#注：skywalking 日志通信的协议是grpc, 一定要开启grpc-log,不然没有对应的日志信息
```