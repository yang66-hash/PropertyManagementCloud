package com.yang.xingdiancloud.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yang.enums.ResponseStatusEnum;
import com.yang.model.ResponseDTO;
import com.yang.xingdiancloud.pojo.House;
import com.yang.xingdiancloud.pojo.UnitBuilding;
import com.yang.xingdiancloud.service.impl.HouseService;
import com.yang.xingdiancloud.service.impl.UnitBuildingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("unit_building")
public class UnitBuildingController {

    private final UnitBuildingService unitBuildingService;

    public UnitBuildingController(UnitBuildingService unitBuildingService) {
        this.unitBuildingService = unitBuildingService;
    }


    /**
     * @param unitBuilding 分页查询条件
     * @param page 当前页
     * @param rows 当前页的数据条数
     * @return
     */
    @GetMapping("getDataByPage")
    public ResponseDTO<IPage> getDataByPage(UnitBuilding unitBuilding,
                                            @RequestParam(value = "page") int page,
                                            @RequestParam(value = "rows") int rows) {

        if (unitBuilding == null) {
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_BLANK);
        }
        if (page<=0 || rows <= 0)
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_INVALID);

        unitBuilding.setId(null);
        return ResponseDTO.success(unitBuildingService.page(new Page<>(page,rows), new QueryWrapper<>(unitBuilding)));
    }


    @PostMapping("getDataById")
    public ResponseDTO getDataById(@RequestParam(value = "id") Integer id) {
        if (id == null || id <= 0)
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_INVALID);
        return ResponseDTO.success(unitBuildingService.getById(id));
    }

}
