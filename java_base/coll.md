# coll to map使用
```json
constructMap = constructList.stream().collect(Collectors.toMap(ProjectConstruct::getId, a -> a, (a, b) -> a));
        
使用toMap()函数之后，返回的就是一个Map了，自然会需要key和value。
toMap()的第一个参数就是用来生成key值的，第二个参数就是用来生成value值的。
第三个参数用在key值冲突的情况下：如果新元素产生的key在Map中已经出现过了，第三个参数就会定义解决的办法。

在你的例子中
.collect(Collectors.toMap(UserBo::getUserId, v -> v, (v1, v2) -> v1));
第一个参数UserBo::getUserId 表示选择UserBo的getUserId作为map的key值；
第二个参数v -> v表示选择将原来的对象作为map的value值；
第三个参数(v1, v2) -> v1中，如果v1与v2的key值相同，选择v1作为那个key所对应的value值
```


