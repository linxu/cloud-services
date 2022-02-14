#### 配置 max_map_count
- sudo sysctl -w vm.max_map_count=262144

#### 安装Docker ELK
- docker pull sebp/elk
- docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -e ES_MIN_MEM=128m  -e ES_MAX_MEM=1024m -it --name elk sebp/elk