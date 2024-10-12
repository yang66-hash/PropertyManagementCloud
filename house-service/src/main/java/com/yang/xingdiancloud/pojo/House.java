package com.yang.xingdiancloud.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("house")
public class House {
    /**
     * 自增主键
     */
    private Integer id;

    /**
     * 所属楼宇
     */
    private String parentBuilding;

    /**
     * 所属单元
     */
    private String parentUnit;

    /**
     * 所属楼层
     */
    private String parentFloor;

    /**
     * 房间号
     */
    private String houseNum;

    /**
     * 房间大小
     */
    private String houseSize;

    /**
     * 房间户型
     */
    private String houseType;

    /**
     * 是否售出：0未售出1已售出
     */
    private String isSold;



    /**
     * 绑定的住户ID（已绑定也代表已售出）
     */
    private Integer userId;
    /**
     * 业主ID（如果售出则不可为空）
     */
    private String ownerId;

}