# aop 实现日志的优雅是实现
## 背景
业务需要创建某个业务的具体的日志记录,排查具体的问题出现在哪里,而没有一个详细的日志记录,往往我们需要通过日子的拦截,实现记录.
而aop处理日志只能处理固定某些数据,一般我们的处理方式都是通过解析不同的参数来判断具体的业务保存方式.

## 逻辑业务代码
### com.learn.service.OrderService
```java
@Service
public class OrderService {

    @RecordOperate(desc = "保存订单",convert = SaveOrderConvert.class)
    public boolean saveOrder(SaveOrder saveOrder){
        System.out.println("保存订单");
        return false;
    }

    @RecordOperate(desc = "更新订单",convert = UpdateOrderConvert.class)
    public boolean updateOrder(UpdateOrder updateOrder) {
        System.out.println("更新订单");
        return false;
    }
}
```
### com.learn.domain.SaveOrder
```java
/**
 * 保存订单
 *
 * @author nie_cq
 * @date 2022/12/17
 */
public class SaveOrder {

    private String id;
    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
```
### com.learn.domain.UpdateOrder
```java
/**
 * 更新订单
 *
 * @author nie_cq
 * @date 2022/12/17
 */
public class UpdateOrder {
    private String orderId;
    private String orderName;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }
}

```
## 核心的aop 
### com.learn.aop.OperateAspect
```java

/**
 * 操作aop
 *
 * @author nie_cq
 * @date 2022/12/17
 */
public class OperateAspect {

    private ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(
            1, 1, 1, TimeUnit.SECONDS, new LinkedBlockingDeque<>(100));

    @Pointcut("@annotation(com.learn.aop.RecordOperate)")
    public void pointcut() {

    }

    @Around("pointcut()")
    public Object around(JoinPoint joinPoint) throws Throwable {
        threadPoolExecutor.execute(() -> {
            MethodSignature signature = (MethodSignature) joinPoint.getSignature();
            RecordOperate annotation = signature.getMethod().getAnnotation(RecordOperate.class);

            OperateLogDO operateLogDO = new OperateLogDO();
            operateLogDO.setDesc(annotation.desc());
            operateLogDO.setResult(Arrays.toString(joinPoint.getArgs()));
            Class<? extends Convert> convert = annotation.convert();
            try {
                Convert newInstance = convert.newInstance();
                OperateLogDO logConvert = newInstance.convert(joinPoint.getArgs()[0]);
                operateLogDO.setOrderId(logConvert.getOrderId());
            } catch (InstantiationException e) {
                throw new RuntimeException(e);
            } catch (IllegalAccessException e) {
                throw new RuntimeException(e);
            }
        });
        return null;
    }
}
```
### com.learn.aop.RecordOperate
```java
/**
 * 记录操作
 *
 * @author nie_cq
 * @date 2022/12/17
 */
public @interface RecordOperate {
    String desc() default "";

    Class<? extends Convert> convert();
}

```
### com.learn.aop.OperateLogDO
```java
/**
 * 操作日志做
 *
 * @author nie_cq
 * @date 2022/12/17
 */
public class OperateLogDO {
    private String orderId;
    private String desc;
    private String result;

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
}

```
