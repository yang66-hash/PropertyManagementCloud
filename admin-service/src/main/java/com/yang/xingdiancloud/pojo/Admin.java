package com.yang.xingdiancloud.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
    * 系统管理员表 
    */
@Data
@TableName("admin")
public class Admin {
    /**
    * 自增主键ID
    */
    private Integer id;

    /**
    * 用户名
    */
    private String userName;

    /**
    * 登录后显示的名字
    */
    private String loginName;

    /**
    * 登录密码（原密码sha1加密  盐值 sha256加密，之后两个相加再进行MD5加密）
    */
    private String password;

}