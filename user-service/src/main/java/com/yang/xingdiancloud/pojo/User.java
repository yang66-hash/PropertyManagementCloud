package com.yang.xingdiancloud.pojo;


import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;


/**
 * lombok
 * @Data 包含get set方法以及toString的默认实现
 * MybatisPlus
 * 默认情况下，如果数据库表是使用标准的下划线命名，且逻辑断点与类名逻辑断点一致，那么MybatisPlus就能直接对应
 * 如 user_info(数据库) 与 UserInfo（实体类）就能直接对应 更多的表与类名的对应方式设置，可以参考MybatisPlus官网
 * 也可以直接使用@TableName注解对应
 */
@Data
@TableName(value = "user")
public class User {
    /**
     * 属性的对应也遵顼下划线命名法与驼峰命名法之间的对应关系，如数据库字段user_name 默认对应userName
     * 也可以直接使用@TableId对应主键，或者使用@TableField实现属性对应
     * 自增主键
     */

    private Integer id;

    /**
     * 姓名
     */
    private String userName;

    /**
     * 用户电话
     */
    private String phone;

    /**
     * 用户身份证ID
     */
    private String cardId;

    /**
     * 性别
     */
    private String sex;

    /**
     * 民族
     */
    private String nation;

    /**
     * 户籍地址
     */
    private String registerAddress;
}
