package com.linxu.cloud.nacosribbonconsumer.web;

import com.linxu.cloud.nacosribbonconsumer.Services;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;

@RefreshScope
@RestController
public class IndexController {

    @Resource
    RestTemplate restTemplate;

    @Value("${env}")
    private String env;

    @GetMapping("/test")
    public String test() {
        return restTemplate.getForObject(Services.EUREKA_PROVIDER + "/test", String.class);
    }

    @GetMapping("/test/{name}")
    public String test(@PathVariable String name) {
        return restTemplate.getForObject(Services.EUREKA_PROVIDER + "/test/{1}", String.class, name);
    }

    @GetMapping("/env")
    public String env() {
        return env;
    }
}
