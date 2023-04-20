# Spring Boot 中常用的注解
@SpringBootApplication:这是一个组合注解,包括 @Configuration、@EnableAutoConfiguration 和 @ComponentScan。把这个注解加在主类上就可以启动 Spring Boot 应用。
@Configuration:表示这个类是一个配置类,可以替代传统的xml配置文件。
@ComponentScan:表示将该类自动扫描组件,它会指示 Spring 对该类所在的包以及子包进行注解驱动的组件扫描。
@EnableAutoConfiguration:启用 Spring Boot 的自动配置机制。
@Bean:注解在方法上,注明这个方法将会被 Spring 容器调用,产生一个 Bean。相当于在 XML 中配置的 <bean>。
@Component:通常用在类上,表示这个类被 Spring 容器管理,就是一个 Bean。
@RestController:注解在类上,表示这是一个控制器,使用 @ResponseBody 之后的内容直接写入 HTTP 响应正文内。
@GetMapping:注解在控制器方法上,表示该方法处理 Get 请求。相当于 @RequestMapping(method = RequestMethod.GET)。
@PostMapping:注解在控制器方法上,表示该方法处理 Post 请求。相当于 @RequestMapping(method = RequestMethod.POST)。
@RequestParam:注解在方法参数上,获取请求参数的值,用在控制器方法的参数前。
@PathVariable:注解在方法参数上,获取 URL 占位符的值。
@Autowired:自动导入依赖的 Bean。
@Service:通常用在服务层类上,表示这是一个服务层的 Bean。
@Value:注入 Spring boot application.properties 配置文件中的值。
@ConditionalOnExpression:根据 SpEL 表达式是否计算结果为 true,来决定是否向容器中注册 Bean。

# @Configuration 的作用
1. 定义配置类:被 @Configuration 注解的类内部包含有一个或多个被 @Bean 注解的方法,这些方法将会被 AnnotationConfigApplicationContext 或 AnnotationConfigWebApplicationContext 类进行扫描,并用于构建 bean 定义,初始化 Spring 容器。
2. 指定 Bean 的作用域:可以通过 @Scope 注解指定 Bean 的作用域。
3. 声明 bean 之间的依赖关系:可以通过让一个 bean 方法调用另一个 bean 方法实现 bean 之间的依赖。
4. 代替 XML 配置文件:传统 Spring 应用大量使用 XML 配置 bean,@Configuration 让我们可以使用 Java 代码替代 XML 配置。
   一个 @Configuration 类的示例:
    ```
   java
   @Configuration
   public class AppConfig {

   @Bean
   public MyService myService() {
   return new MyServiceImpl();
   }

   @Bean
   public MyDao myDao() {
   return new MyDaoImpl();
   }
   }
   ```
   这个 AppConfig 类等价于以下的 XML 配置:
   ```
   xml
   <beans>
   <bean id="myService" class="com.example.MyServiceImpl"/>
   <bean id="myDao" class="com.example.MyDaoImpl"/>
   </beans>
   ```
   @Configuration 并不意味着完全抛弃 XML 配置,实际项目中往往会结合 XML 和 @Configuration 注解同时使用。@Configuration 提供了一种更简洁的配置方式,使配置更加清晰,并且从配置与代码中解耦。
   总之,@Configuration 注解的目的是让 Bean 的定义和依赖关系的声明可以完全在 Java 代码中完成,无需 XML 配置文件