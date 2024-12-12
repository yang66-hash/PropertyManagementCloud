package com.yang.xingdiancloud.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.yang.xingdiancloud.mapper.UserMapper;
import com.yang.xingdiancloud.pojo.User;
import com.yang.xingdiancloud.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService extends ServiceImpl<UserMapper, User> implements IUserService {

    @Autowired
    private UserMapper userMapper;

    public IPage getDataByPage(User user, int page, int rows) {
        IPage<User> curPage = new Page<>(page,rows);
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        // 动态构建查询条件
        queryWrapper.lambda().eq(user.getUserName()!=null,User::getUserName,user.getUserName())
                .eq(user.getPhone()!=null,User::getPhone,user.getPhone())
                .eq(user.getCardId()!=null,User::getCardId,user.getCardId())
                .eq(user.getSex()!=null,User::getSex,user.getSex())
                .eq(user.getNation()!=null,User::getNation,user.getNation())
                .like(user.getRegisterAddress()!=null,User::getRegisterAddress,user.getRegisterAddress());
        return  userMapper.selectPage(curPage,queryWrapper);

    }

    public boolean existData(int userId) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("id",userId);
        Long count = userMapper.selectCount(queryWrapper);
        if (count > 0) {
            return true;
        }
        else return false;
    }
}
