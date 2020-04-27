# Monitoring2
 
![](img/schema.png)
 
Ferramentas de monitoramento de hosts, containers e serviços
 
- Docker
- Grafana
- MariaDB
- Prometheus (Node_Exporter's e Cadvisor)
- Zabbix (Zabbix agents e SNMP)
 
Infraestrutura

- Servidor Linux
- Mikrotik
 
Instalação do Docker e iniciando o cluster Swarm
```
# curl -fsSL https://get.docker.com | sh
# docker swarm init
```
 
Clonado o repositório monitoring2
```
# git clone https://github.com/madson7/monitoring2.git
 
# cd monitoring2
```
 
Build da imagem do Promotheus
```
# docker build -t madson7/prometheus_alpine ./dockerfiles/prometheus
```
Diretorios persistentes para o Zabbix
```

Deploy Stack com Docker Swarm
```
# docker stack deploy -c docker-compose.ymling2
```
 
Status dos serviços
```
# docker service ls
```
Configurando o banco SQL
```
mysql -uroot -h192.168.0.7 -p < ./conf/mysql/datadb.sql
```
 
Iniciar o Node do Mikrotik
```
# ./conf/node-exporter/exporter_mikrotik -address 192.168.0.10 \
-device "Mikrotik 01" -password 12345678 -user prometheus
```
Onde -address é o endereço do seu mikrotik. -device é o nome do rótulo do dispositivo na saída de métricas para o prometheus. O usuário e senha deve ser criadas no seu mikrotik, porta padrão 9436
 
Iniciar o Node do Linux
```
# ./conf/node-exporter/exporter_linux --web.listen-address=":9100"
```
Onde --web.listen-address=":9100" é a porta do seu servidor Linux local.
 
Iniciar o Ping Exporter
```
# ./conf/node-exporter/ping/exporter_ping --config.path \
conf/node-exporter/ping/ping.yml --web.listen-address=":9101"
```
Onde --web.listen-address=":9101" é a porta do seu servidor Linux local e --config.path são os IP's e sites.