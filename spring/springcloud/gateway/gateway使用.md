# gateway 使用
## springCloud gateway特性
1. 基于spring framework5 ,project reactor 和springBoot 2.0
2. 集成hystrix 熔断器
3. 集成spring cloud discoveryClient
4. predicates 和 filter 作用于特定路由，易于编写的predicates和filter
5. 具备一些网关的高级特性：动态路由，限流，路径重写
### 三大功能
1. filter(过滤器):   

可以使用它的拦截器和修改请求，并且对上游的响应，进行第二次的处理。过滤器为org.springframework.cloud.gateway.filter.GateWayFilter类的实例 

2. route(路由):
   
网关配置的基本组成模块,一个route模块由一个id,一个目标uri,一组断言和一组过滤器定义,如果断言为真,则路由匹配,目标uri会被访问.

3. predicate(断言):
   
这是一个java8的predicate,可以使用它来匹配来自http请求的任何内容,例如headers或参数,断言的输入类型是一个ServerWebExchange

### webflux 模型

webflux模型替代了旧的servlet线程模型。用少量的线程处理request和response io操作，这些线程称为Loop线程，而业务交给响应编程框架处理，响应式编程是非常灵活的，用户可以将业务中阻塞的操作提交到响应式框架的work线程中执行，而不阻塞的操作依然可以在Loop线程中进行处理，大大提升了Loop线程的利用率。
![img](https://img2023.cnblogs.com/blog/309403/202302/309403-20230202163132804-1898314038.png)

### spring cloud gateway的处理流程
客户端向spring cloud gateway发出请求，然后在gateway handler Mapping中找到与请求匹配的路由，将其发送到gateway web handler. handler再通过指定的过滤器链来将请求发送到我们实际的服务执行业务逻辑，然后返回。过滤器之间用虚线分开是因为过滤器可能会在发送代理请求之前(pre)或者之后(post)执行业务逻辑。
![img](https://img2023.cnblogs.com/blog/309403/202302/309403-20230202164923411-163105543.png)