package com.yang.xingdiancloud.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yang.enums.ResponseStatusEnum;
import com.yang.model.ResponseDTO;
import com.yang.xingdiancloud.pojo.PropertyChargeItem;
import com.yang.xingdiancloud.pojo.PropertyChargeVisit;
import com.yang.xingdiancloud.service.impl.PropertyChargeItemService;
import com.yang.xingdiancloud.service.impl.PropertyChargeVisitService;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("pro_charge_visit")
public class PropertyChargeVisitController {


    private final PropertyChargeVisitService propertyChargeVisitService;

    public PropertyChargeVisitController(PropertyChargeVisitService propertyChargeVisitService) {
        this.propertyChargeVisitService = propertyChargeVisitService;

    }



    /**
     * @param propertyChargeVisit 分页查询条件
     * @param page 当前页
     * @param rows 当前页的数据条数
     * @return
     */
    @GetMapping("getDataByPage")
    public ResponseDTO<IPage> getDataByPage(PropertyChargeVisit propertyChargeVisit,
                                            @RequestParam(value = "page") int page,
                                            @RequestParam(value = "rows") int rows) {

        if (propertyChargeVisit == null) {
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_BLANK);
        }
        if (page<=0 || rows <= 0)
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_INVALID);

        propertyChargeVisit.setId(null);
        return ResponseDTO.success(propertyChargeVisitService.page(new Page<>(page,rows), new QueryWrapper<>(propertyChargeVisit)));
    }


    @PostMapping("getDataById")
    public ResponseDTO getDataById(@RequestParam(value = "id") Integer id) {
        if (id == null || id <= 0)
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_INVALID);
        PropertyChargeVisit propertyChargeVisit = propertyChargeVisitService.getById(id);
        Object o = restTemplate.getForObject("http://house-service/house/getDataById?id=" + propertyChargeVisit.getHouseId(), Object.class);
        return ResponseDTO.success(propertyChargeVisitService.getById(id));
    }

}
