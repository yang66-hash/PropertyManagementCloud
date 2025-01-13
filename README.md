# Property Management Cloud说明文档

## 系统说明
本微服务系统依据xingdian-property-management-system(基于Spring Boot3)小区物业管理系统进行模块拆分实现

|              框架 /工具               |   功能    |     版本     |
|:---------------------------------:|:-------:|:----------:|
|            spring boot            |  核心框架   |   3.2.4    |
|           spring cloud            |  核心框架   |  2023.0.1  |
|       spring cloud alibaba        |  核心框架   | 2023.0.1.0 |
|    spring-boot-starter-webflux    |  服务调用   |   3.2.4    |
| spring-cloud-starter-loadbalancer |  负载均衡   |  2023.0.1  |
|               MYSQL               |   数据库   |    5.7     |
|            MybatisPlus            |  ORM框架  |   3.5.5    |
|           Nacos Server            | 服务注册和发现 |   2.0.3    |
|              Knife4j              |  API文档  |   4.4.0    |


## 服务模块

|        模块        |       功能说明        |
|:----------------:|:-----------------:|
|      common      | 各个模块依赖的基础类相关公共子工程 |
|  admin-service   |    小区物业管理员管理服务    |
| car-park-service |      停车位管理服务      |
|  house-service   |      住房管理服务       |
| property-service |      物业管理服务       |
|   user-service   |      住户管理服务       |

## 部署说明
怎么打成jar，并部署至K8S集群，参见admin-service的README.md