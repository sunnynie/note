# stream字敦去重 
```java
   public class ListStreamDistinctTest {
    public static void main(String[] args) {
        // 一个集合中放入4个学生对象
        List<Student> list = new ArrayList<>();
        list.add(new Student(10002L, "ZhangSan", 18, 175.2));
        list.add(new Student(10001L, "LiSi", 19, 175.2));
        list.add(new Student(10004L, "Peter", 19, 170.8));
        list.add(new Student(10004L, "Peter", 19, 170.8));

        // 按整个个对象去重
        System.out.println("整个对象去重：");
        list.stream().distinct()
                .forEach(System.out::println);

        // 指定某个字段去重
        System.out.println("指定age属性去重（方法一）：");
        list.stream().filter(distinctByKey1(s -> s.getAge()))
                .forEach(System.out::println);

        // 方法二（用循环)
        System.out.println("指定age属性去重（方法二）：");
        TreeSet<Student> students = new TreeSet<>(Comparator.comparing(s -> s.getAge()));
        for (Student student : list) {
            students.add(student);
        }
        new ArrayList<>(students)
                .forEach(System.out::println);

        // 方法三：（是方法二的变形），此方法来源于：https://blog.csdn.net/qq_28988969/article/details/81119587
        System.out.println("指定age属性去重（方法三）：");
        list.stream().collect(Collectors.collectingAndThen(Collectors.toCollection(() -> new TreeSet<>(Comparator.comparing(s -> s.getAge()))), ArrayList::new))
                .forEach(System.out::println);


    }

    // 次方法来源于：https://blog.csdn.net/haiyoung/article/details/80934467
    static <T> Predicate<T> distinctByKey1(Function<? super T, ?> keyExtractor) {
        Map<Object, Boolean> seen = new ConcurrentHashMap<>();
        return t -> seen.putIfAbsent(keyExtractor.apply(t), Boolean.TRUE) == null;
    }
}
```