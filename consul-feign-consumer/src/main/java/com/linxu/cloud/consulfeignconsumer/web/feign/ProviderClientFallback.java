package com.linxu.cloud.consulfeignconsumer.web.feign;

import org.springframework.stereotype.Component;

@Component
public class ProviderClientFallback implements ProviderClient {

    @Override
    public String test() {
        return "fallback";
    }

    @Override
    public String test(String name) {
        return "fallback";
    }
}
