package com.yang.xingdiancloud.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yang.enums.ResponseStatusEnum;
import com.yang.model.ResponseDTO;
import com.yang.xingdiancloud.pojo.Admin;
import com.yang.xingdiancloud.service.impl.AdminService;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@Slf4j
@RestController
@RequestMapping("admin")
public class AdminController {

    private final AdminService adminService;

    public AdminController(AdminService adminService) {
        this.adminService = adminService;

    }


    /**
     * @param admin 查询条件  userName loginName 两者不空进行查询 空直接忽略条件进行查询
     * @param page
     * @param rows
     * @return
     */
    @GetMapping("/getDataByPage")
    public ResponseDTO getDataByPage(Admin admin, @RequestParam(value = "page") int page,@RequestParam(value = "rows") int rows) {

        if (admin == null ) {
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_BLANK);
        }
        if (page<=0 || rows <= 0)
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_INVALID);

        admin.setId(null);
        admin.setPassword(null);
        return ResponseDTO.success(adminService.page(new Page<>(page,rows), new QueryWrapper<>(admin)));

    }


    /**
     * 增加某一小区管理员
     * @param admin 插入的对象
     * @return ResultMessage
     */
    @PostMapping("insertInfo")
    public ResponseDTO insertInfo(@RequestBody Admin admin) {
        try {
            // 执行新增方法，处理密码

            boolean success = adminService.save(admin);
            if(success) {
                return ResponseDTO.success();
            } else {
                return ResponseDTO.failure();
            }
        } catch(Exception e) {
            return ResponseDTO.failure(ResponseStatusEnum.SYSTEM_UNKNOWN_ERROR, "操作出现异常：" + e.getMessage());
        }
    }



}
