package com.yang.xingdiancloud.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
    * 物业收费记录信息表 
    */
@Data
@TableName("property_charge_visit")
public class PropertyChargeVisit implements Serializable {
    /**
    * 自增主键
    */
    private Integer id;

    /**
     * 收费项目ID
     */
    private Integer itemId;


    /**
     * 收费项名称
     */
    private String itemName;


    /**
     * 住房ID
     */
    private Integer houseId;

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
    private String userName;

    /**
    * 客户手机号
    */
    private String phone;

    /**
    * 费用
    */
    private Integer price;

    /**
    * 上月读数
    */
    private Integer prevMonthCount;

    /**
    * 本月读数
    */
    private Integer currMonthCount;

    /**
    * 本次用量
    */
    private Integer useCount;

    /**
    * 录入时间
    */
    private String  visitDate;

    /**
    * 抄表时间
    */
    private String readDate;

    /**
    * 抄表人
    */
    private String readName;

    /**
    * 记录状态（0已缴费  1未交费）
    */
    private String visitStatus;

    private static final long serialVersionUID = 1L;

}