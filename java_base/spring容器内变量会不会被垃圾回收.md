# spring 容器内变量会不会被垃圾回收
Spring 容器管理的 Bean 对象同样遵循 Java 对象的生命周期,同样依赖垃圾回收机制被销毁。但是,Spring 容器会对对象的生命周期进行管理,以满足SCOPE的要求。
主要有以下几点:
1. 对象依然需要没有引用才会被回收:Spring 容器管理的 Bean 对象,当容器关闭时,它们同样需要没有任何变量或对象引用才会变为可回收对象,等待垃圾回收。
2. SCOPE为singleton的对象不会被回收:默认SCOPE为singleton,这种情况下的Bean对象会被容器缓存,并重复使用,所以不会被垃圾回收。
3. SCOPE为prototype的对象会被回收:每次请求时会创建一个新的Bean对象,请求完成后,该对象会变为可回收对象,等待被垃圾回收。
4. SCOPE为session的对象在会话结束后会被回收:在一个会话中的请求共享一个Bean对象,会话结束后,该对象会变为可回收对象,等待被垃圾回收。
5. 对象可以自定义init和destroy方法:Bean对象可以实现InitializingBean和DisposableBean接口,定义init和destroy方法。当SCOPE为singleton的对象,init方法会在容器启动时调用,destroy会在容器关闭时调用。其他SCOPE的对象,这两个方法会在对象创建和销毁前后被调用。
   所以,总结来说:
- Spring 容器管理的 Bean 对象同样遵循垃圾回收机制,需要没有引用才会被销毁。
- 对象的生命周期受SCOPE管理,如singleton的对象会被缓存重用,prototype的对象会每次创建新对象。
- 对象可以实现初始化与销毁方法,在对象生命周期的适当点被调用。
- Spring 的生命周期管理机制可以与垃圾回收机制很好地结合,满足各类应用场景下Bean对象的需要。