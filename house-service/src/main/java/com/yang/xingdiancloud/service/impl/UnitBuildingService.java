package com.yang.xingdiancloud.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yang.xingdiancloud.mapper.HouseMapper;
import com.yang.xingdiancloud.mapper.UnitBuildingMapper;
import com.yang.xingdiancloud.pojo.House;
import com.yang.xingdiancloud.pojo.UnitBuilding;
import com.yang.xingdiancloud.service.IHouseService;
import com.yang.xingdiancloud.service.IUnitBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UnitBuildingService extends ServiceImpl<UnitBuildingMapper, UnitBuilding> implements IUnitBuildingService {

    @Autowired
    private UnitBuildingMapper unitBuildingMapper;

}