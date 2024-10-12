package com.yang.xingdiancloud.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yang.xingdiancloud.mapper.CarParKMapper;
import com.yang.xingdiancloud.pojo.CarPark;
import com.yang.xingdiancloud.service.ICarParkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarParkService extends ServiceImpl<CarParKMapper, CarPark> implements ICarParkService {

    @Autowired
    private CarParKMapper carParKMapper;

    public IPage<CarPark> getDataByPage(int current, int size, CarPark carPark){
        IPage<CarPark> page = new Page<>(current,size);
        QueryWrapper<CarPark> queryWrapper = new QueryWrapper<>();
        // 动态构建查询条件
        queryWrapper.lambda().eq(carPark.getOwnerName()!=null,CarPark::getCarParkType,carPark.getOwnerName())
                .eq(carPark.getPhone()!=null,CarPark::getPhone,carPark.getPhone())
                .eq(carPark.getCarParkType()!=null,CarPark::getCarParkType,carPark.getCarParkType())
                .eq(carPark.getParkState()!=null,CarPark::getParkState,carPark.getParkState());
        return  carParKMapper.selectPage(page,queryWrapper);

    }

}
