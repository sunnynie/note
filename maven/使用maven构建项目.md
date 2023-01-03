# 使用maven构建项目

1. 使用mvn archetype:generate命令:

   ```shell
   mvn archetype:generate -DgroupId=com.company.app -DartifactId=myapp -DarchetypeArtifactId=maven-archetype-quickstart -DineractiveMode=false
   ```
2. 使用mvn archetype:create命令,如下:

   ````shell
   mvn archetype:create -DgroupId=com.company.app -DartifactId=myapp -DarchetypeArtifactId=maven-archetype-quickstart -DineractiveMode=false
   ```
   ````

不推荐使用第二种,第二种生成的文件会在当前用户的目录里创建
