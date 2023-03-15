# BIO、NIO、AIO区别
# BIO
block io 同步阻塞式IO,就是我们平常使用的传统IO,它的特点是模式简单使用方便，并发能力低。
# NIO
同步非阻塞IO,是传统IO的升级，客户端和服务端通过channel通信，实现多路复用
# AIO
asynchronous IO 是NIO的升级，也叫NIO2,实现了异步非阻塞IO，异步IO的操作基于事件和回调机制
