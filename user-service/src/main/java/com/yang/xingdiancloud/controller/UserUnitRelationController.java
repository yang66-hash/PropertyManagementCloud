package com.yang.xingdiancloud.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yang.enums.ResponseStatusEnum;
import com.yang.model.ResponseDTO;
import com.yang.xingdiancloud.pojo.UserComplaint;
import com.yang.xingdiancloud.pojo.UserUnitRelation;
import com.yang.xingdiancloud.service.impl.UserComplaintService;
import com.yang.xingdiancloud.service.impl.UserUnitRelationService;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("user_unit_relation")
public class UserUnitRelationController {

    public static final Logger logger = LoggerFactory.getLogger(UserController.class);

    private final UserUnitRelationService userUnitRelationService;

    public UserUnitRelationController(UserUnitRelationService userUnitRelationService) {
        this.userUnitRelationService = userUnitRelationService;

    }

    /**
     * @param userUnitRelation 分页查询条件
     * @param page 当前页
     * @param rows 当前页的数据条数
     * @return
     */
    @GetMapping("getDataByPage")
    public ResponseDTO<IPage> getDataByPage(UserUnitRelation userUnitRelation,
                                            @RequestParam(value = "page") int page,
                                            @RequestParam(value = "rows") int rows) {

        if (userUnitRelation == null) {
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_BLANK);
        }
        if (page<=0 || rows <= 0)
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_INVALID);

        userUnitRelation.setId(null);
        return ResponseDTO.success(userUnitRelationService.page(new Page<>(page,rows), new QueryWrapper<>(userUnitRelation)));
    }


    @PostMapping("getDataById")
    public ResponseDTO getDataById(@RequestParam(value = "id") Integer id) {
        if (id == null || id <= 0)
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_INVALID);
        return ResponseDTO.success(userUnitRelationService.getById(id));
    }



}
