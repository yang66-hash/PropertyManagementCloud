# 花2-3min读完以下内容，了解如何将Nacos设置为注册中心

# 添加相应的nacos注册中心
直接外部启动nacos server

# 如何将服务注册到nacos注册中心
以cloud-admin-service为例

在pom.xml文件中添加nacos注册中心依赖，内容如下：

因为我们在parent工程的pom.xml已经导入了Spring Cloud Alibaba全家桶组件的统一版本定义，所以子工程中无需再导入version
```xml
        <!--        注册中心依赖-->
        <dependency>
            <groupId>com.alibaba.cloud</groupId>
            <artifactId>spring-cloud-starter-alibaba-nacos-discovery</artifactId>
        </dependency>
```
再在cloud-admin-service服务启动入口类AdminMainApplication上加上注解@EnableDiscoveryClient即可实现Nacos服务发现与注册功能。
如何针对