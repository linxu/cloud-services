package com.linxu.cloud.nacosprovider.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class IndexController {

    @GetMapping("/test")
    public String test() {
        return "hello world";
    }

    @GetMapping("/test/{name}")
    public String test2(@PathVariable String name) {
        return name;
    }
}
