package com.linxu.cloud.zookeeperfeignconsumer.web.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Service
@FeignClient(value = "zookeeper-provider", fallback = ProviderClientFallback.class)
public interface ProviderClient {
    @GetMapping("/test")
    public String test();

    @GetMapping("/test/{name}")
    public String test(@PathVariable("name") String name);
}
