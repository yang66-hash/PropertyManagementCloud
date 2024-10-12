package com.yang.xingdiancloud.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yang.xingdiancloud.pojo.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper extends BaseMapper<User> {
}