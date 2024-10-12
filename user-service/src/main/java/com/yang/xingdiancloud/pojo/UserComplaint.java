package com.yang.xingdiancloud.pojo;

import lombok.Data;

/**
    * 用户投诉信息表 
    */
@Data
public class UserComplaint {
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
    * 投诉信息
    */
    private String complaintInfo;

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