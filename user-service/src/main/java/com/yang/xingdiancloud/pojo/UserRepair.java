package com.yang.xingdiancloud.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
    * 用户报修信息表 
    */
@Data
@TableName("user_repair")
public class UserRepair {
    /**
    * 自增主键
    */
    private Integer id;

    /**
    * 客户姓名
    */
    private String userName;

    /**
    * 客户电话
    */
    private String phone;

    /**
    * 报修信息
    */
    private String repairInfo;

    /**
    * 创建时间
    */
    private String createDate;

    /**
    * 是否处理 0未处理 1已处理
    */
    private String isSolve;

    /**
    * 对应的用户ID
    */
    private Integer userId;
}