package com.yang.xingdiancloud.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yang.xingdiancloud.mapper.UserComplaintMapper;
import com.yang.xingdiancloud.mapper.UserMapper;
import com.yang.xingdiancloud.pojo.User;
import com.yang.xingdiancloud.pojo.UserComplaint;
import com.yang.xingdiancloud.service.IUserComplaintService;
import com.yang.xingdiancloud.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserComplaintService extends ServiceImpl<UserComplaintMapper, UserComplaint> implements IUserComplaintService {



}
