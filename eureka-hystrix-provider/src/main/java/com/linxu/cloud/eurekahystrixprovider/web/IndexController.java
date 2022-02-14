package com.linxu.cloud.eurekahystrixprovider.web;

import com.netflix.hystrix.contrib.javanica.annotation.DefaultProperties;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixProperty;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import static com.netflix.hystrix.contrib.javanica.conf.HystrixPropertiesManager.*;

@Slf4j
@RestController
@DefaultProperties(defaultFallback = "global_fallback")
public class IndexController {

    @GetMapping("/test")
    public String test() {
        return "hello world";
    }

    @HystrixCommand(fallbackMethod = "timeout_fallback", commandProperties = {
            @HystrixProperty(name = "execution.isolation.thread.timeoutInMilliseconds", value = "3000")
    })
    @GetMapping("/timeout")
    public String timeout() throws InterruptedException {
        Thread.sleep(5000);
        return "hello timeout";
    }

    @HystrixCommand
    @GetMapping("/test/error")
    public String error() {
        int t = 1 / 0;
        return t + "";
    }


    @HystrixCommand(fallbackMethod = "circuit_breaker_fallback", commandProperties = {
            @HystrixProperty(name = CIRCUIT_BREAKER_ENABLED, value = "true"),
            @HystrixProperty(name = CIRCUIT_BREAKER_REQUEST_VOLUME_THRESHOLD, value = "10"),
            @HystrixProperty(name = CIRCUIT_BREAKER_SLEEP_WINDOW_IN_MILLISECONDS, value = "10000"),
            @HystrixProperty(name = CIRCUIT_BREAKER_ERROR_THRESHOLD_PERCENTAGE, value = "50"),
    })
    @GetMapping("/test/error/{hit}")
    public String error(@PathVariable boolean hit) {
        if (hit) {
            throw new RuntimeException("test error");
        }
        return "success";
    }

    public String timeout_fallback() {
        return "timeout fallback";
    }

    public String circuit_breaker_fallback(boolean hit) {
        return "circuit breaker fallback";
    }

    public String global_fallback() {
        return "global fallback";
    }
}
