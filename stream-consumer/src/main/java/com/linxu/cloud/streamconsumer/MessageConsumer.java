package com.linxu.cloud.streamconsumer;

import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.messaging.Message;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@EnableBinding(MqInputs.class)
public class MessageConsumer {

    @StreamListener(MqInputs.PAY)
    public void pay(Message<String> message) {
        log.info("pay message: {}", message.getPayload());
    }

    @StreamListener(MqInputs.ORDER)
    public void order(Message<String> message) {
        log.info("order message: {}", message.getPayload());
    }
}
