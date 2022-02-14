package com.linxu.cloud.streamprovider.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.messaging.Source;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.support.MessageBuilder;

import javax.annotation.Resource;

@Slf4j
@EnableBinding(Source.class)
public class MessageProvider {

    @Resource
    private MessageChannel output;

    public void send(String msg) {
        output.send(MessageBuilder.withPayload(msg).build());
        log.info("publish message: {}", msg);
    }
}
