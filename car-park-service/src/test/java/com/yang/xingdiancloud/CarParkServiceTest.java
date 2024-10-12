package com.yang.xingdiancloud;

import com.yang.xingdiancloud.pojo.CarPark;
import com.yang.xingdiancloud.service.impl.CarParkService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class CarParkServiceTest {


    @Autowired
    private CarParkService carParkService;

    @Test
    public void testHouseServicePage() {
        CarPark carPark = new CarPark();
        carPark.setParkState("0");
        System.out.println(carPark.toString());
        System.out.println(carParkService.getDataByPage(1,20,carPark).getRecords());
    }
}
