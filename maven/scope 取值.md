# scope 取值

| scope取值  | 有效范围（compile, runtime, test） | 依赖传递 | 例子          |
|----------|------------------------------|------|-------------|
| compile  | all                          | 是    | spring-core |
| provided | compile,test                 | 否    | servlet-api |
| runtime  | runtime,test                 | 是    | jdbc驱动      |
| test     | test                         | 否    | junit       |
| system   | compile,test                 | 是    |             |

正如上表所示，

compile ：为默认的依赖有效范围。如果在定义依赖关系的时候，没有明确指定依赖有效范围的话，则默认采用该依赖有效范围。此种依赖，在编译、运行、测试时均有效。

provided ：在编译、测试时有效，但是在运行时无效。例如：servlet-api，运行项目时，容器已经提供，就不需要Maven重复地引入一遍了。

runtime ：在运行、测试时有效，但是在编译代码时无效。例如：JDBC驱动实现，项目代码编译只需要JDK提供的JDBC接口，只有在测试或运行项目时才需要实现上述接口的具体JDBC驱动。

test ：只在测试时有效，例如：JUnit。

system ：在编译、测试时有效，但是在运行时无效。和provided的区别是，使用system范围的依赖时必须通过systemPath元素显式地指定依赖文件的路径。由于此类依赖不是通过Maven仓库解析的，而且往往与本机系统绑定，可能造成构建的不可移植，因此应该谨慎使用。systemPath元素可以引用环境变量。例如：

 


