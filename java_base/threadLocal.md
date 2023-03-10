### 2.源码学习

    1.ThreadLocal是怎么保证了线程隔离的?
    2.ThreadLocal注释中提到的隐式引用是什么?有什么用?
    3.ThreadLocal为什么要用到隐式引用?而不用强式引用?
    4.据说ThreadLocal会发生内存泄漏?什么情况下会发生内存泄漏?如何避免内存泄漏?
    5.使用ThreadLocal有什么需要注意的点?
### 2.1 ThreadLocal 内部使用了哪些数据结构?
    
首先,我们来看下ThreadLocal中几个比较重要的数据结构.
```
/**
* 用于ThreadLocal内部ThreadLocalMap数据结构的哈希值,用于降低哈希冲突
**/
private final int threadLocationCode = nextHashCode();

/**
* 原子操作生成哈希值,默认值为0
**/
private final AtomicInteger nextHashCode= new AtomicInteger();

/**
* 用于进行计算出ThreadLocalHashCode的哈希值
**/
private static final int HASH_INCREMENT=0X61c88647;

```
### 2.2 threadLocal 保证线程安全
thread 源码：
```java
ThreadLocal.ThreadLocalMap threadLocal=null

//设置方法
public void set(T value){
    Thread t=Thread.currentThread();
    ThreadLocalMap map=getMap(t);
    if(map!=null)
        map.set(this,value);
    else
        createMap(t,value);
    
}

//getMap()
ThreadLocalMap getMap(Thread t){
    return t.threadLocals;
}
```
threadLocal操作值的时候，是获取当前线程的threadLocalMap对象，然后把值设置到这个对象中，这样对于不同的线程获取到的就是不同的threadLocalMap，那么向其中的保存值或者修改值只会影响到当前的线程，这样保证了线程的安全

### 2.3 threadLocal 定义
thread 是线程私有的，每个线程都是独立的副本变量，通过get/set方法设置/获取变量。只要线程是活动的且ThreadLocal实例是可以访问的，且每个线程局部变量的副本持有隐式的引用。线程消失后，其线程本地实例的所有副本都将进行垃圾回收（除非存在这些副本的其他引用）。
Thread是线程私有的，每个线程都有其独特的副本变量，通过set/get设置变量/获取变量

### 2.4上下问设计模式
对于一个线程，可能有多个任务，分别有多个执行步骤。如果第n个执行步骤需要用到第一个执行步骤中的一个变量，常见的方法是设置一个上下文Context,将这个变量放到上下文Context中，通过这个方法都需要加这样的以一个参数，是不合理的。此时就可以运用ThreadLocal来改善上下文设计