package com.yang.xingdiancloud;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class AdminMainApplication {
    public static void main(String[] args) {
        SpringApplication.run(AdminMainApplication.class, args);
    }
}