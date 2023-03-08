# ServiceLocatorFactoryBean
## 使用场景
如果你有一个对象是从spring的beanFactory拿出来，spring的bean一般分为singleton和prototype
### singleton
是整个spring容器中只有一个实例
### prototype
是每次注入的时候new 一个新实例，但是注入一般到对象的属性中，那对于一个对象一般只会注入一次。
### serviceLocationFactoryBean
假如每次call一个方法的时候希望使用的是最新的实例，这时就要靠**serviceLocationFactoryBean** 

## 具体使用
###  factory
```java
interface ServiceFactory{  
    Object do();
}
```
### buidler
```java
class ServiceBuilder{
    @Inject
    private ServiceFactory serviceFactory;
    
    Service build(String name){
      Service service=  serviceFactory.do(name);
      return service;
    }
}
```
### servicelocationFactoryBean 主要源码
```java
		private Object invokeServiceLocatorMethod(Method method, Object[] args) throws Exception {
			Class serviceLocatorMethodReturnType = getServiceLocatorMethodReturnType(method);
			try {
				String beanName = tryGetBeanName(args);
				if (StringUtils.hasLength(beanName)) {
					// Service locator for a specific bean name
					return beanFactory.getBean(beanName, serviceLocatorMethodReturnType);
				}
				else {
					// Service locator for a bean type
					return beanFactory.getBean(serviceLocatorMethodReturnType);
				}
			}
           }


		private String tryGetBeanName(Object[] args) {
			String beanName = "";
			if (args != null && args.length == 1 && args[0] != null) {
				beanName = args[0].toString();
			}
			// Look for explicit serviceId-to-beanName mappings.
			if (serviceMappings != null) {
				String mappedName = serviceMappings.getProperty(beanName);
				if (mappedName != null) {
					beanName = mappedName;
				}
			}
			return beanName;
		}
```