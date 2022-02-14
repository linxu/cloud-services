package com.linxu.cloud.nacossentinelprovider;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class NacosSentinelProviderApplication {

    public static void main(String[] args) {
        SpringApplication.run(NacosSentinelProviderApplication.class, args);
    }

}
