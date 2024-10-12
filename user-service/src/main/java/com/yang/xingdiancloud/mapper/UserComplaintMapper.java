package com.yang.xingdiancloud.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yang.xingdiancloud.pojo.User;
import com.yang.xingdiancloud.pojo.UserComplaint;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserComplaintMapper extends BaseMapper<UserComplaint> {
}