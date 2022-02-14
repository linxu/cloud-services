package com.linxu.cloud.eurekaribbonconsumer.web;

import com.linxu.cloud.eurekaribbonconsumer.Services;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class IndexController {

    @Autowired
    RestTemplate restTemplate;

    @GetMapping("/test")
    public String test() {
        return restTemplate.getForObject(Services.EUREKA_PROVIDER + "/test", String.class);
    }

    @GetMapping("/test/{name}")
    public String test(@PathVariable String name) {
        return restTemplate.getForObject(Services.EUREKA_PROVIDER + "/test/{1}", String.class, name);
    }
}
