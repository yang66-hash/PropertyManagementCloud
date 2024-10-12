package com.yang.xingdiancloud.service.impl;

import com.yang.xingdiancloud.pojo.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserServiceTest {

    @Autowired
    private UserService userService;

    @Test
    public void test() {

        User user = new User();
        user.setRegisterAddress("京");

        System.out.println(userService.getDataByPage(user,1,5).getRecords());
    }
}