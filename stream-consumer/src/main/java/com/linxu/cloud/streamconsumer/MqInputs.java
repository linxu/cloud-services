package com.linxu.cloud.streamconsumer;

import org.springframework.cloud.stream.annotation.Input;
import org.springframework.messaging.SubscribableChannel;

public interface MqInputs {
    String ORDER = "order";
    String PAY = "pay";

    @Input(ORDER)
    SubscribableChannel order();

    @Input(PAY)
    SubscribableChannel pay();
}
