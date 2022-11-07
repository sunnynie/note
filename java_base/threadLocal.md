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
