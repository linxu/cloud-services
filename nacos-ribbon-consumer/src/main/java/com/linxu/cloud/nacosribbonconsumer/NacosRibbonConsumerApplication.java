package com.linxu.cloud.nacosribbonconsumer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class NacosRibbonConsumerApplication {

    public static void main(String[] args) {
        SpringApplication.run(NacosRibbonConsumerApplication.class, args);
    }

}
