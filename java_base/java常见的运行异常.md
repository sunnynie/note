# java 常见的运行异常


```
1. NullPointerException（空指针异常）：使用了空对象或者空值，导致程序出现异常。

2. IndexOutOfBoundsException（数组下标越界异常）：访问了数组中不存在的索引位置。

3. ArrayStoreException（数组类型不兼容异常）：当试图将错误类型的对象存储到数组时抛出。

4. ClassCastException（类转换异常）：试图将一个对象强制转换为不是该对象的实例的类。

5. IllegalArgumentException（非法参数异常）：传递给方法的参数不合法。

6. NumberFormatException（数字格式异常）：试图将一个字符串转换为数字，但该字符串的格式不正确。

7. ArithmeticException（算术异常）：当试图进行除以零或者取模操作时抛出。

8. UnsupportedOperationException（不支持操作异常）：当尝试在不支持该操作的对象上调用该操作时抛出。

9. ConcurrentModificationException（并发修改异常）：当一个线程正在遍历一个集合时，另一个线程修改了该集合，导致出现异常。

10. StackOverflowError（栈溢出异常）：递归调用方法时出现了无限循环，导致栈空间被耗尽。

11. OutOfMemoryError（内存溢出异常）：程序申请的内存超出了 JVM 所能分配的最大内存。
```
