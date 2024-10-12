package com.yang.xingdiancloud.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
    * 楼宇信息表 
    */
@Data
@TableName("unit_building")
public class UnitBuilding {
    /**
    * 主键ID
    */
    private Integer id;

    /**
    * 楼宇号
    */
    private Integer buildingNum;

    /**
    * 单元数量
    */
    private Integer unitCount;

    /**
    * 楼层
    */
    private Integer floorCount;
}