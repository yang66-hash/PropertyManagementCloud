# Property Management Cloud说明文档

<!-- TOC -->
* [Property Management Cloud说明文档](#property-management-cloud说明文档)
  * [系统说明](#系统说明)
  * [服务模块](#服务模块)
  * [部署说明](#部署说明)
  * [This project is built for following purpose](#this-project-is-built-for-following-purpose)
  * [related Documentation](#related-documentation)
<!-- TOC -->

## 关于这个项目
本项目是基于微服务架构开发的小区物业管理系统，主要用于演示微服务系统的基础架构，非完整业务实现。适用于以下场景：
- 理解Spring Cloud多模块微服务项目结构
- 学习小区物业系统业务逻辑划分方案
- 初学微服务的案例参考，简单入门Spring Boot的后端开发模式

本微服务系统依据xingdian-property-management-system(基于Spring Boot3)小区物业管理系统进行模块拆分实现。
(注：其中的业务逻辑|模块拆分只是基于个人意见,能力有限划分恐有不合理之处，如果您发现不妥之处，还请指正)

## 系统说明

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


## 服务模块说明

|        模块        |       功能说明        |
|:----------------:|:-----------------:|
|      common      | 各个模块依赖的基础类相关公共子工程 |
|  admin-service   |    小区物业管理员管理服务    |
| car-park-service |      停车位管理服务      |
|  house-service   |      住房管理服务       |
| property-service |      物业管理服务       |
|   user-service   |      住户管理服务       |
|  Springgateway   |      统一网关路由       |
|       auth       |       授权模块        |
|  config-server   |       配置中心        |
|      nacos       |      服务注册与发现      |
|      zipkin      |       链路监控        |



许多模块仍未编入，但是提供的[property_db_cloud.sql](property_db_cloud.sql)数据库文件中已将相应的数据表搭建并填充了演示数据。

## 部署说明
怎么打成jar，并部署至K8S集群，参见admin-service的README.md



**Suggestions and project Improvement are Invited**

## related Documentation
- [how to pull and run in local](./)
- how to make contributions


