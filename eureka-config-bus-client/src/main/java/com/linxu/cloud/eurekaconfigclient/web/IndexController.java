package com.linxu.cloud.eurekaconfigclient.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RefreshScope
@RestController
public class IndexController {

    @Value("${env}")
    private String env;

    @GetMapping("/env")
    public String env() {
        return env;
    }

}
