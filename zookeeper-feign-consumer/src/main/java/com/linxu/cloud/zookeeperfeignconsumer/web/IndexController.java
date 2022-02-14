package com.linxu.cloud.zookeeperfeignconsumer.web;

import com.linxu.cloud.zookeeperfeignconsumer.web.feign.ProviderClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class IndexController {

    @Autowired
    ProviderClient providerClient;

    @GetMapping("/test")
    public String test() {
        return providerClient.test();
    }

    @GetMapping("/test/{name}")
    public String test(@PathVariable String name) {
        return providerClient.test(name);
    }
}
