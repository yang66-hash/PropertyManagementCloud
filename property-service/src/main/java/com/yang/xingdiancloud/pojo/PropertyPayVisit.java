package com.yang.xingdiancloud.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
    * 物业缴费记录信息表 
    */
@Data
@TableName("property_pay_visit")
public class PropertyPayVisit {
    /**
    * 自增主键
    */
    private Integer id;

    /**
    * 对应物业收费记录表的ID
    */
    private Integer chargeId;

    /**
    * 楼宇号
    */
    private String buildingNum;

    /**
    * 单元号
    */
    private String unitNum;

    /**
    * 房间号
    */
    private String houseNum;

    /**
    * 客户姓名
    */
    private String clientName;

    /**
    * 收费项目
    */
    private String itemName;

    /**
    * 缴费金额（单位：分）
    */
    private Integer payMoney;

    /**
    * 缴费方式
    */
    private String payType;

    /**
    * 收费人员
    */
    private String chargePerson;

    /**
    * 缴费时间
    */
    private String payDate;
}