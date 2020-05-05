# Monitoring2
 
![](img/schema.png)

Este repositório utilizar algumas ferramentas de monitoramento de forma modular para colher métricas e logs de rede, hosts, containers e aplicações.
 
Não irei abordar teoria e conceitos, para isso utilize a documentação oficial.

- Docker (Swarm)
- Cadvisor
- Grafana
- Mysql
- Prometheus (Node_Exporter's)
- Zabbix (Zabbix serve, Zabbix agents e SNMP)
- Elastic (Elasticsearch, Kibana, Logstash e Metricbeat)
 
Infraestrutura

- Servidor Linux
- Mikrotik

Instalação do Docker e iniciando o cluster Swarm

![](img/swarm.gif)

```
# curl -fsSL https://get.docker.com | sh
# docker swarm init
# docker swarm join --token
```
 
Clonado o repositório monitoring2
```
# git clone https://github.com/madson7/monitoring2.git
 
# cd monitoring2
```

Deploy Stack com Docker Swarm
```
# docker stack deploy -c docker-compose.ym monitoring2
```

Configurando o banco SQL
```
mysql -uroot -h192.168.0.7 -p < ./conf/mysql/datadb.sql
```
 
Iniciar o Node do Mikrotik
```
# ./conf/node-exporter/exporter_mikrotik -address 192.168.0.10 -device "Mikrotik 01" -password 12345678 -user prometheus
```
Onde -address é o endereço do seu mikrotik. -device é o nome do rótulo do dispositivo na saída de métricas para o prometheus. O usuário e senha deve ser criadas no seu mikrotik, porta padrão 9436
 
Iniciar o Node do Linux
```
# ./conf/node-exporter/exporter_linux --web.listen-address=":9100"
```
Onde --web.listen-address=":9100" é a porta do seu servidor Linux local.
 
Iniciar o Ping Exporter
```
# ./conf/node-exporter/ping/exporter_ping --config.path conf/node-exporter/ping/ping.yml --web.listen-address=":9101"
```
Onde --web.listen-address=":9101" é a porta do seu servidor Linux local e --config.path são os IP's e sites.


- [x] teste
- [ ] teste
[ ]