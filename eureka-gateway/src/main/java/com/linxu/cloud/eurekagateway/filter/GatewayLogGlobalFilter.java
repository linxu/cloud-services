package com.linxu.cloud.eurekagateway.filter;

import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.lang.annotation.Annotation;

@Slf4j
@Component
public class GatewayLogGlobalFilter implements GlobalFilter, Order {

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        log.info("Global Log Filter");
        return chain.filter(exchange);
    }

    @Override
    public int value() {
        return 0;
    }

    @Override
    public Class<? extends Annotation> annotationType() {
        return null;
    }
}
