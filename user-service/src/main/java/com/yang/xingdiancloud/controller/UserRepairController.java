package com.yang.xingdiancloud.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yang.enums.ResponseStatusEnum;
import com.yang.model.ResponseDTO;
import com.yang.xingdiancloud.pojo.User;
import com.yang.xingdiancloud.pojo.UserRepair;
import com.yang.xingdiancloud.service.impl.UserComplaintService;
import com.yang.xingdiancloud.service.impl.UserRepairService;
import com.yang.xingdiancloud.service.impl.UserService;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("user_repair")
public class UserRepairController {


    private final UserRepairService userRepairService;
    private final UserService userService;

    public UserRepairController(UserRepairService userRepairService, UserService userService) {
        this.userRepairService = userRepairService;
        this.userService = userService;
    }


    /**
     * @param userRepair 分页查询条件
     * @param page 当前页
     * @param rows 当前页的数据条数
     * @return
     */
    @GetMapping("getDataByPage")
    public ResponseDTO<IPage> getDataByPage(UserRepair userRepair,
                                            @RequestParam(value = "page") int page,
                                            @RequestParam(value = "rows") int rows) {

        if (userRepair == null) {
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_BLANK);
        }
        if (page<=0 || rows <= 0)
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_INVALID);

        userRepair.setId(null);
        return ResponseDTO.success(userRepairService.page(new Page<>(page,rows), new QueryWrapper<>(userRepair)));
    }


    @PostMapping("getDataById")
    public ResponseDTO getDataById(@RequestParam(value = "id") Integer id) {
        if (id == null || id <= 0)
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_INVALID);
        return ResponseDTO.success(userService.getById(id));
    }


}
