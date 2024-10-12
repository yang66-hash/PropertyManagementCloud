package com.yang.xingdiancloud.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yang.enums.ResponseStatusEnum;
import com.yang.model.ResponseDTO;
import com.yang.xingdiancloud.pojo.CarPark;
import com.yang.xingdiancloud.service.impl.CarParkService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("car_park")
public class CarParkController {


    private final CarParkService carParkService;

    public CarParkController(CarParkService carParkService) {
        log.info("UserController constructor is executing ...");
        this.carParkService = carParkService;

    }

    /**
     * @param carPark 分页查询条件
     * @param page 当前页
     * @param rows 当前页的数据条数
     * @return
     */
    @GetMapping("searchByPage")
    public ResponseDTO<IPage> getDataByPage(CarPark carPark, @RequestParam(value = "page") int page, @RequestParam(value = "rows") int rows) {
        if (carPark == null || page<=0 || rows<=0)
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_INVALID);
        //支支持其他属性的条件分页查询
        carPark.setId(null);

        return ResponseDTO.success(carParkService.getDataByPage(page,rows,carPark));
    }



    @GetMapping("getDataById")
    public ResponseDTO getDataById(@RequestParam(value = "id") Integer id) {
        if (id == null || id <= 0)
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_INVALID);
        return ResponseDTO.success(carParkService.getById(id));
    }

}
