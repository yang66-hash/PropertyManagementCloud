package com.yang.xingdiancloud.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;

import com.yang.enums.ResponseStatusEnum;
import com.yang.model.ResponseDTO;
import com.yang.xingdiancloud.pojo.House;
import com.yang.xingdiancloud.service.impl.HouseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("house")
public class HouseController {

    private final HouseService houseService;

    public HouseController(HouseService houseService) {
        this.houseService = houseService;
    }


    /**
     * @param house 分页查询条件
     * @param page 当前页
     * @param rows 当前页的数据条数
     * @return
     */
    @GetMapping("getDataByPage")
    public ResponseDTO<IPage> getDataByPage(House house, @RequestParam(value = "page") int page,@RequestParam(value = "rows") int rows) {
        if (house == null || page<=0 || rows<=0)
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_INVALID);
        //支支持其他属性的条件分页查询
        house.setId(null);
        house.setOwnerId(null);
        house.setUserId(null);

        return ResponseDTO.success(houseService.getDataByPage(page,rows,house));
    }


    @GetMapping("getDataById")
    public ResponseDTO getDataById(@RequestParam(value = "id") Integer id) {
        if (id == null || id <= 0)
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_INVALID);
        House house = houseService.getById(id);
        Object o = restTemplate.getForObject("http://car-park-service/car_park/getDataById?id=" + house.getOwnerId(), Object.class);
        return ResponseDTO.success(houseService.getById(id));
    }

}
