package com.yang.xingdiancloud.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
    * 物业收费项目信息表 
    */
@Data
@TableName("property_charge_item")
public class PropertyChargeItem {
    /**
    * 自增主键
    */
    private Integer id;

    /**
    * 收费项目名
    */
    private String chargeName;

    /**
    * 创建时间
    */
    private String createDate;

    /**
    * 项目单价
    */
    private Integer itemPrice;

    /**
    * 价格描述
    */
    private String priceDesc;
}