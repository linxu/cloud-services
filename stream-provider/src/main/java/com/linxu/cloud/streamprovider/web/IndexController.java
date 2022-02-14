package com.linxu.cloud.streamprovider.web;

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

    @GetMapping("/send")
    public String send() {
        messageProvider.send(UUID.randomUUID().toString());
        return "ok";
    }

}
