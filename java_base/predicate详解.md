`Predicate`  是 Java 8 引入的函数式接口之一，它定义了一个可以传入一个参数并返回一个布尔值的方法  `test` ，该方法通常用于对一些数据进行过滤，判定数据是否符合某些条件。
## 基本用法
`Predicate`  接口的定义如下：
@FunctionalInterface
public interface Predicate<T> {
boolean test(T t);
}
可以看到，在  `Predicate`  接口中只声明了一个抽象方法  `test` ，其接收一个泛型参数  `T`  并返回一个  `boolean`  类型的值。我们可以使用 lambda 表达式或者方法引用来创建一个  `Predicate`  对象，来对数据进行过滤。例如，我们可以通过下面的代码对一个整数数组进行过滤，只保留其中的偶数：
import java.util.Arrays;
import java.util.function.Predicate;
public class PredicateExample {
public static void main(String[] args) {
int[] numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
Predicate<Integer> even = n -> n % 2 == 0;
Arrays.stream(numbers).filter(even).forEach(System.out::println);
}
}
在上面的代码中，我们使用 lambda 表达式来创建了一个  `even`  对象，来判断一个整数是否为偶数。我们使用  `filter`  方法和  `even`  对象来过滤整个数组，仅保留其中的偶数。最后，我们使用  `forEach`  方法来遍历结果并将其打印出来。
## 链式调用
`Predicate`  接口还支持链式调用，其中可以连接多个  `Predicate`  对象来构成一个更复杂的判断条件。例如，我们可以通过下面的代码来对一个字符串数组进行过滤，只保留其中长度大于 5 的字符串，并且首字母为大写字母：
import java.util.Arrays;
import java.util.function.Predicate;
public class PredicateExample {
public static void main(String[] args) {
String[] strings = {"Apple", "Banana", "orange", "PEAR"};
Predicate<String> lengthGreaterThan5 = s -> s.length() > 5;
Predicate<String> startsWithUpperCase = s -> Character.isUpperCase(s.charAt(0));
Arrays.stream(strings)
.filter(lengthGreaterThan5.and(startsWithUpperCase))
.forEach(System.out::println);
}
}
在上面的代码中，我们使用了两个  `Predicate`  对象  `lengthGreaterThan5`  和  `startsWithUpperCase` ，分别用于判断字符串的长度和首字母是否为大写字母。我们使用  `and`  方法将两个  `Predicate`  对象连接起来，表示两个条件都必须满足才能被保留。最后，我们使用  `forEach`  方法遍历结果并打印出来。
## 默认方法
`Predicate`  接口中还定义了一些默认方法，可以供我们使用。例如， `and`  方法可以将两个  `Predicate`  对象连接起来，作为一个逻辑与的条件：
default Predicate<T> and(Predicate<? super T> other) {
Objects.requireNonNull(other);
return (t) -> test(t) && other.test(t);
}
同理，还有  `or`  方法和  `negate`  方法，分别表示逻辑或和逆向判断：
default Predicate<T> or(Predicate<? super T> other) {
Objects.requireNonNull(other);
return (t) -> test(t) || other.test(t);
}
default Predicate<T> negate() {
return (t) -> !test(t);
}
## 总结
本文简单介绍了  `Predicate`  接口的定义和基本用法，以及如何通过链式调用和默认方法来增强其功能。 `Predicate`  接口在 Java 8 中被广泛应用于各种场景中，如集合过滤、输入验证等。