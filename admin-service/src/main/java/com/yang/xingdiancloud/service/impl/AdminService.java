package com.yang.xingdiancloud.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yang.xingdiancloud.mapper.AdminMapper;
import com.yang.xingdiancloud.pojo.Admin;
import com.yang.xingdiancloud.service.IAdminService;
import org.springframework.stereotype.Service;

@Service
public class AdminService extends ServiceImpl<AdminMapper, Admin> implements IAdminService {


}
