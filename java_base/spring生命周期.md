# spring生命周期
1. 实例化一个bean,也就是我们通常的new
2. 按照spring上下文实例化的bean进行配置，也就是IOC注入
3. 如果这个bean实现dao了beanNameAware接口，会调用它实现的,setBeanName(String beanId)方法，此处传递的是spring配置文件的Bean的Id
4. 如果这个Bean实现了beanFactoryAware接口，会调用它的实现的setBeanFactory()传递的是spring工厂本身（可以用这个方法获取到其他的bean）
5. 如果这个bean实现了ApplicationContextAware接口，会调用setApplicationContext(applicationContext )方法，传入spring上下文，该方法同样可以实现步骤4，但比4更好，以为applicationContext是Beanfactory的子接口，有更多的实现方法
6. 如果这个bean关联了BeanPostProcessor接口，将会调用postProcessBeforeInitalization(Object obj,String s)方法，BeanPostProcessor经常被用作是bean内容的更改，并且由于这个是bean初始化结束时调用After方法，也可以用于内存或者缓存技术
7. 如果这个Bean在spring配置文件中配置了init-method属性会自动调用其配置的初始方法
8. 如果这个bean关联了BeanPostProccessor接口，将会调用postAfterInitzation(Object obj,String s)方法
    注：以上的工作完成之后就可以使用这个bean,那这个bean是single的，所以一般情况下我们调用的是同一个id的bean会在内容地址相同的实例。
    
9. 当bean不在需要的时候，会经过清理阶段，如果bean实现了disposableBean接口，会调用其实现的destory方法

10. 最后，如果这个bean的spring配置中配置了destory-method 属性，会自动调用其配置的销毁方法


## spring beanNameAware使用
```java
package com.springinit;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanNameAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class SpringInit implements ApplicationContextAware, BeanNameAware {

    public static ApplicationContext context;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        System.out.println("spring init");
        context = applicationContext;
    }

    @Override
    public void setBeanName(String name) {
        System.out.println("BeanNameAware:" + name);
    }

}

# 启动一个spring容器之后打印的结果
BeanNameAware:springInit
spring init
```
## 结论
1. spring容器启动在生产Bean的时候，会回调像applicationContextAware,beanNameAware这些接口方法
2. 执行顺序上，先执行beanNameAware接口的setBeanName方法，再执行applicationContextAware接口的setApplicationContext方法，执行顺序的原理可查看
3.  对于使用@component注解纳入spring管理的bean,若未设置bean的name,则默认为首字母小写的bean类名

    另外：除了上述两个Aware后缀的接口外，spring还提供了其他的生命周期的aware接口，比如：BeanFactoryAware、BeanClassLoaderAware等，在某些bean的业务逻辑中若需要用到spring容器的这些属性，可以采用实现Aware后缀的接口来获取，用的最多还是ApplicationContextAware来获取ApplicationContext。