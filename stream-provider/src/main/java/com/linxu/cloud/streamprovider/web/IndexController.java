package com.linxu.cloud.streamprovider.web;

import com.linxu.cloud.streamprovider.domain.Order;
import com.linxu.cloud.streamprovider.service.MessageProvider;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.UUID;

@Slf4j
@RestController
public class IndexController {

    @Resource
    private MessageProvider messageProvider;

    @GetMapping("/order")
    public String order() {
        Order order = new Order(1L, "my order");
        messageProvider.order(order);
        return "order";
    }

    @GetMapping("/pay")
    public String pay() {
        messageProvider.pay(UUID.randomUUID().toString());
        return "pay";
    }

}
