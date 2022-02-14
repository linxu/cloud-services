package com.linxu.cloud.eurekahystrixprovider;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;

@EnableHystrix
@EnableCircuitBreaker
@EnableEurekaClient
@SpringBootApplication
public class EurekaHystrixProviderApplication {

    public static void main(String[] args) {
        SpringApplication.run(EurekaHystrixProviderApplication.class, args);
    }

}
