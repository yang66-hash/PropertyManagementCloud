package com.yang.xingdiancloud.config;

import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;

@Component
public class WebClientConfig {

    @Bean
//    一定能要负载均衡注解,要不无法实现注册服务名的识别
    @LoadBalanced
    public WebClient.Builder webClientBuilder() {

        return WebClient.builder();
    }

}