package com.linxu.cloud.streamprovider.service;

import org.springframework.cloud.stream.annotation.Output;
import org.springframework.messaging.MessageChannel;

public interface MqOutputs {
    String ORDER = "order";
    String PAY = "pay";

    @Output(ORDER)
    MessageChannel order();

    @Output(PAY)
    MessageChannel pay();
}
