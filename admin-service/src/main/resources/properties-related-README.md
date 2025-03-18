如果你想直接使用本地的配置文件，不再从外部加载配置文件，请在该文件夹下创建application.yml文件。

内容如下：
```yaml
spring:
  profiles:
    active: dev # 取自方括号中 application-[dev|test|prod].yml
```
删除bootstrap.properties文件即可