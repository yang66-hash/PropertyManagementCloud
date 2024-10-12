package com.yang.xingdiancloud.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
    * 用户与住房关系对应表 
    */
@Data
@TableName("user_unit_relation")
public class UserUnitRelation {
    /**
    * 自增主键
    */
    private Integer id;

    /**
    * 用户ID
    */
    private Integer userId;

    /**
    * 住房ID
    */
    private Integer unitId;

    /**
    * 创建时间
    */
    private String createDate;

    /**
    * 是否是户主 1是  0否
    */
    private String isHouseHolder;

}