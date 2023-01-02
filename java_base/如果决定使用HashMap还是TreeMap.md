# 如何决定使用hashMap还是treeMap

## 介绍

- treeMap<k,v>的key值是要求实现java.lang.Comparable,所以迭代的时候TreeMap默认是按照key值升序排序;treeMap的实现是基于红黑树结构,适用于按自然顺序或者自定义的顺序遍历key
- hashMap<k,v>的key值实现散列hashCode().分部是散列\均与的,不支持排序;数据结构主要是桶(数组),链表或者红黑树.适用于在Map中插入,删除和定位元素.

## 结论

如果你需要得到一个有序的结果就应该使用treeMap(因为hashMap中元素的排列顺序是不固定的).除此之外,由于hashMap有更好的性能,所以大多数不需要排序的情况下我们会使用hashMap

## 拓展

### 1. hashMap和treeMap实现

#### hashMap:基于哈希表实现,使用hashMap要求添加的键类明确定义了hashCode()和equal()可以重写hashCode() 和equal(),为了优化hashMap空间的使用,你可以调优初始化容量和负载因子

- hashMap():构建一个空的哈希映像
- hashMp(Map m):构建一个哈希映像,并且添加映像m的所有映像
- hashMap(int initialCapacity):构建一个拥有特定容量的空哈希映像
- hashMap(int initialCapacity,float loadFactory):构建一个拥有特定容量和加载因子的空的哈希映射

#### treeMap: 基于红黑树实现,TreeMap没有调优的选项,因为该树总处于平衡状态

- treeMap():构建一个空的映射树
- treeMap(Map m):构建一个映射树,并且添加映射m中所有的元素
- treeMap(Comparatory c):构建一个映射树,并且使用特定的比较器对关键字进行排序
- treeMap(SortedMap m):构建一个映射树,添加映射树m中所有的映射,并且使用与有序的映射m相同的比较器排序.

### 2.hashMap和treeMap都是非线程安全的

hashMap继承abstractMap抽象类,treeMap继承自sortdMap接口.

#### abstractMap抽象:

覆盖了equals()和hashCode()方法以确保两个映射返回相同的哈希值.如果两个映射大小相同的,包含同样的键值,则两个映射相等.映射的哈希值是映射元素的哈希值的总和,其中每个元素是Map.Entry()接口的一个实现,因此不论映射内部的顺序如何,两个相等的映射会报告相同的哈希值.

#### sortedMap接口:

它用来保持键值的顺序,sortedMap接口为映射的视图(子集),包含两个端点,提供了范围方法.除了排序是作用于映射的键值以外,处理sortedMap和处理sortedSet一样,添加Comparator接口的实现.treeMap类是它的唯一的一个实现.
