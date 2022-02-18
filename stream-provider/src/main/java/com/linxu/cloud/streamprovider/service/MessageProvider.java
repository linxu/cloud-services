package com.linxu.cloud.streamprovider.service;

import com.linxu.cloud.streamprovider.domain.Order;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.messaging.support.MessageBuilder;

import javax.annotation.Resource;

@Slf4j
@EnableBinding(MqOutputs.class)
public class MessageProvider {

    @Resource
    private MqOutputs outputs;

    public void order(Order order) {
        outputs.order().send(MessageBuilder.withPayload(order).build());
        log.info("publish order: {}", order);
    }

    public void pay(String msg) {
        outputs.pay().send(MessageBuilder.withPayload(msg).build());
        log.info("publish pay: {}", msg);
    }
}
