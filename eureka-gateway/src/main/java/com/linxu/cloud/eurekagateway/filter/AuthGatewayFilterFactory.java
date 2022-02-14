package com.linxu.cloud.eurekagateway.filter;

import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import reactor.core.publisher.Mono;

@Component
public class AuthGatewayFilterFactory extends AbstractGatewayFilterFactory<Object> {

    @Override
    public GatewayFilter apply(Object config) {
        return (exchange, chain) -> {
//            String token = exchange.getRequest().getHeaders().getFirst("Authorization");
            String token = exchange.getRequest().getQueryParams().getFirst("token");
            if (!StringUtils.hasText(token)) {
                ServerHttpResponse response = exchange.getResponse();
                response.setStatusCode(HttpStatus.UNAUTHORIZED);
                HttpHeaders headers = response.getHeaders();
                headers.add("Content-Type", MediaType.APPLICATION_JSON_VALUE);
                String msg = "未登录";
                return response.writeWith(Mono.just(response.bufferFactory().wrap(msg.getBytes())));
            }
            return chain.filter(exchange);
        };
    }

}