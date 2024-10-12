package com.yang.xingdiancloud.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yang.enums.ResponseStatusEnum;
import com.yang.model.ResponseDTO;
import com.yang.xingdiancloud.pojo.User;
import com.yang.xingdiancloud.service.impl.UserService;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.loadbalancer.reactive.ReactorLoadBalancerExchangeFilterFunction;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("user")
public class UserController {



    private final UserService userService;
    private final WebClient.Builder clientBuilder;
    @Autowired
    private ReactorLoadBalancerExchangeFilterFunction reactorLoadBalancerExchangeFilterFunction;

    public UserController(UserService userService , WebClient.Builder clientBuilder) {
        log.info("UserController constructor is executing ...");
        this.userService = userService;
        this.clientBuilder = clientBuilder;
    }

    /**
     * @param user 分页查询条件
     * @param page 当前页
     * @param rows 当前页的数据条数
     * @return
     */
    @GetMapping("getDataByPage")
    public ResponseDTO<IPage> getDataByPage(User user,
                                            @RequestParam(value = "page") int page,
                                            @RequestParam(value = "rows") int rows) {

        if (user == null) {
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_BLANK);
        }
        if (page<=0 || rows <= 0)
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_INVALID);

        user.setId(null);
        return ResponseDTO.success(userService.getDataByPage(user,page,rows));
    }


    @PostMapping("getDataById")
    public ResponseDTO getDataById(@RequestParam(value = "id") Integer id) {
        if (id == null || id <= 0)
            return ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_INVALID);
        return ResponseDTO.success(userService.getById(id));
    }

    /**
     * @param id 用户id
     * @return 返回该用户下的所有资源 停车位 房屋 物业相关缴费记录
     */
    @GetMapping("getAllWithUserId")
    public Mono<? extends ResponseDTO> getAllWithUserId(@RequestParam(value = "id") Integer id){
        log.info(UserController.class +"  " + "getAllWithUserId" + "  entered ...");
        if (id<=0)
            return Mono.just(ResponseDTO.failure(ResponseStatusEnum.PARAM_IS_INVALID));
        Mono<ResponseDTO> houseMono = clientBuilder.baseUrl("http://cloud-house-service").build().get()
                .uri(uriBuilder -> uriBuilder
                        .path("/house/getDataById")
                        .queryParam("id",id)
                        .build())
                .retrieve()
                .bodyToMono(ResponseDTO.class);
        Mono<ResponseDTO> carParkMono = clientBuilder.baseUrl("http://cloud-car-park-service").build().get()
                .uri(uriBuilder -> uriBuilder
                        //只能填API路径 基础路径需要在baseUrl中设置，要不path会抹除http://的一个斜杠
                        .path("/car_park/getDataById")
                        .queryParam("id",id)
                        .build())
                .retrieve()
                .bodyToMono(ResponseDTO.class);
        Mono<ResponseDTO> payVisitMono = clientBuilder.baseUrl("http://cloud-property-service").build().get()
                .uri(uriBuilder -> uriBuilder
                        //只能填API路径 基础路径需要在baseUrl中设置，要不path会抹除http://的一个斜杠
                        .path("/pro_pay_visit/getDataById")
                        .queryParam("id",id)
                        .build())
                .retrieve()
                .bodyToMono(ResponseDTO.class);


        return Mono.zip(houseMono, carParkMono, payVisitMono).map(results->{
            Object houseRes = results.getT1().getData();
            Object carParkRes = results.getT2().getData();
            Object payVisitRes = results.getT3().getData();
            Map<String,Object> resultMap = new HashMap<>();
            resultMap.put("houseRes",houseRes);
            resultMap.put("carParkRes",carParkRes);
            resultMap.put("payVisitRes",payVisitRes);
            log.info(UserController.class +"  " + "getAllWithUserId" + "  exit successfully ...");
            return ResponseDTO.success(ResponseStatusEnum.SUCCESS,resultMap);
        }).onErrorReturn(ResponseDTO.failure(ResponseStatusEnum.SERVICE_UNAVAILABLE));
    }

}
