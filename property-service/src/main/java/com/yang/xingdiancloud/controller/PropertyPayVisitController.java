package com.yang.xingdiancloud.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yang.enums.ResponseStatusEnum;
import com.yang.model.ResponseDTO;
import com.yang.xingdiancloud.pojo.PropertyChargeVisit;
import com.yang.xingdiancloud.pojo.PropertyPayVisit;
import com.yang.xingdiancloud.service.impl.PropertyChargeVisitService;
import com.yang.xingdiancloud.service.impl.PropertyPayVisitService;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("pro_pay_visit")
public class PropertyPayVisitController {


    private final PropertyPayVisitService propertyPayVisitService;

    public PropertyPayVisitController(PropertyPayVisitService propertyPayVisitService) {
        this.propertyPayVisitService = propertyPayVisitService;

    }

    /**
     * @param propertyPayVisit 分页查询条件
     * @param page 当前页
     * @param rows 当前页的数据条数
     * @return
     */
    @GetMapping("getDataByPage")
    public ResponseDTO<IPage> getDataByPage(PropertyPayVisit propertyPayVisit,
                                            @RequestParam(value = "page") int page,
                                            @RequestParam(value = "rows") int rows) {

        if (propertyPayVisit == null) {
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_BLANK);
        }
        if (page<=0 || rows <= 0)
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_INVALID);

        propertyPayVisit.setId(null);
        return ResponseDTO.success(propertyPayVisitService.page(new Page<>(page,rows), new QueryWrapper<>(propertyPayVisit)));
    }


    @GetMapping("getDataById")
    public ResponseDTO getDataById(@RequestParam(value = "id") Integer id) {
        if (id == null || id <= 0)
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_INVALID);
        return ResponseDTO.success(propertyPayVisitService.getById(id));
    }

}
