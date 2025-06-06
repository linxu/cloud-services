# cloud services

## 服务注册中心
- eureka(维护)
  - @EnableEurekaServer
  - @EnableEurekaClient
  - 集群: 多个eureka配置双向注册
- zookeeper
  - @EnableDiscoveryClient
  - 启动: ./zkServer.sh start
- consul
  - @EnableDiscoveryClient
  - 启动: ./consul agent -dev
- nacos
  - @EnableDiscoveryClient

## 服务调用
- ribbon
  - @LoadBalanced + RestTemplate
- feign(维护)
- open-feign
  - @EnableFeignClients
  - @FeignClient

## 服务降级/熔断/限流/监控
- Hystrix(维护)
  - @EnableHystrix
  - @EnableCircuitBreaker
  - @HystrixCommand
    - fallbackMethod 
- Hystrix-Dashboard
  - @EnableHystrixDashboard
- resilence4j
- sentinel
  - @SentinelResource
    - fallback
    - blockHandler
- sentinel-dashboard

## 服务网关
- zuul(维护)
- gateway

## 服务配置
- config(维护)
  - @EnableConfigServer
  - @RefreshScope
  - 手动刷新配置: curl -X POST "http://xxxxxx/actuator/refresh"
  - 自动刷新配置(bus全局通知): curl -X POST "http://xxxxxx/actuator/bus-refresh"
  - 自动刷新配置(bus定点通知): curl -X POST "http://xxxxxx/actuator/bus-refresh/{name}:{port}"
- nacos

## 服务总线
- bus
  - rabbitmq 
- nacos

## 服务链路跟踪
- SkyWalking
- sleuth
- zipkin
  - dashboard: http://xxxxxx:9411/zipkin

## 消息中间件
- Spring cloud stream
  - rabbitmq
  - kafka

## 分布式事物
- Seata
  - @GlobalTransaction
- Seata Server

## 分布式唯一ID
- UUID 唯一，随机字符串，不支持索引
- Mysql自增ID 唯一, 自增长, 不支持高并发
  - AUTO_INCREMENT
  - REPLACE INTO t_ids (service) value ('order')
- Redis全局ID 唯一, 支持高并发
  - 两台集群方式：
  - INCRBY uuid 2
  - INCRBY uuid 3
- SnowFlake 唯一, 按时间递增
  - datacenterid
  - workerid
