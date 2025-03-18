# Property Management Cloud说明文档

<div align="center">
    <img src="https://img.shields.io/badge/Spring_Cloud-微服务异味检测-blue"/>
    <img src="https://img.shields.io/badge/microservice_template-微服务模板-green"/>
</div>




本项目是基于微服务架构开发的小区物业管理系统，主要用于演示微服务系统的基础架构，非完整业务实现。**其下三个分支并行用于不同目的。**。需要microservice模板的关注microservice-template分支即可。

本微服务系统依据xingdian-property-management-system(基于Spring Boot3)小区物业管理系统进行模块拆分实现。 (注：其中的业务逻辑|模块拆分只是基于个人意见, 如果您发现不妥之处，还请指正)

## 关于仓库三个分支的说明

- master: 微服务异味检测平台的使用示例(仍在开发中 ...)
- microservice-bad-smell: 微服务异味重构平台的示例代码
- microservice-template: **基于Spring Cloud微服务模板**，内部包含少量业务逻辑，但是更多的目的是为了提供一个新手入门微服务的基础

## microservice-template分支的说明

适用于以下场景：
* 理解Spring Cloud多模块微服务项目结构
* 学习小区物业系统业务逻辑划分方案
* 初学微服务的案例参考，简单入门Spring Boot的后端开发模式

## master分支以及microservice-bad-smell分支说明
Spring Cloud微服务系统的异味检测以及重构相关的示例工程

## 整体系统说明

microservice-template分支下的示例系统刨去了复杂的调用关系，保留了最基础的分布式微服务的框架。

许多示例模板仍是使用的Spring Boot2.x以及相关配套相关框架，本模板使用Spring Boot3以及相关框架实现。

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
针对各个分支下系统的拉取以及使用，参见各个分支的说明文档：**README-[分支名称].md**