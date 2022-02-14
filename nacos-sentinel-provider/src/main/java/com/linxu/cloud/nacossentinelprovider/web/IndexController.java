package com.linxu.cloud.nacossentinelprovider.web;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.alibaba.csp.sentinel.slots.block.flow.FlowException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class IndexController {

    @SentinelResource(value = "fallback", fallback = "handlerFallback", blockHandler = "handlerBlock")
    @GetMapping("/test/{id}")
    public String test(@PathVariable int id) {
        if (id < 0) {
            throw new RuntimeException("test");
        }
        return "hello world";
    }

    public String handlerFallback(@PathVariable int id, Throwable e) {
        log.info("handlerFallback");
        return "fallback";
    }

    public String handlerBlock(@PathVariable int id, BlockException e) {
        log.info("handlerBlock");
        return "block";
    }

}
