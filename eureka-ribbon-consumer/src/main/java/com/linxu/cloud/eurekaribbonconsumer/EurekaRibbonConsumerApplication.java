package com.linxu.cloud.eurekaribbonconsumer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@EnableEurekaClient
@SpringBootApplication
public class EurekaRibbonConsumerApplication {

    public static void main(String[] args) {
        SpringApplication.run(EurekaRibbonConsumerApplication.class, args);
    }

}
