package com.yang.xingdiancloud.service.impl;



import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.yang.xingdiancloud.mapper.HouseMapper;
import com.yang.xingdiancloud.pojo.House;
import com.yang.xingdiancloud.service.IHouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HouseService extends ServiceImpl<HouseMapper, House> implements IHouseService {

    @Autowired
    private HouseMapper houseMapper;

    public IPage<House> getDataByPage(int current,int size, House house){
        IPage<House> page = new Page<>(current,size);
        QueryWrapper<House> queryWrapper = new QueryWrapper<>();
        // 动态构建查询条件
        queryWrapper.lambda().eq(house.getParentBuilding()!=null, House::getParentBuilding,house.getParentBuilding())
                .eq(house.getParentUnit()!=null,House::getParentUnit,house.getParentUnit())
                .eq(house.getParentFloor()!=null,House::getParentFloor,house.getParentFloor())
                .eq(house.getHouseNum()!=null,House::getHouseNum,house.getHouseNum())
                .eq(house.getHouseSize()!=null,House::getHouseSize,house.getHouseSize())
                .eq(house.getHouseType()!=null,House::getHouseType,house.getHouseType())
                .eq(house.getIsSold()!=null,House::getIsSold,house.getIsSold());
        return  houseMapper.selectPage(page,queryWrapper);

    }
}