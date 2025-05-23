package com.yang.xingdiancloud;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;


@EnableDiscoveryClient
@SpringBootApplication
public class PropertyMainApplication {
    public static void main(String[] args) {
        SpringApplication.run(PropertyMainApplication.class, args);
    }

}