# Monitor-Discovery
 
![](img/schema.png)
 
Ferramentas de monitoramento de hosts, containers e serviços
 
- Docker
- Grafana
- Prometheus (Node_Exporter's)
- Zabbix (Zabbix agents e SNMP)
- Cadvisor
 
Infraestrutura

- Servidor Linux
- Mikrotik
 
Instalação do Docker e iniciando o cluster Swarm
```
# curl -fsSL https://get.docker.com | sh
# docker swarm init
```
 
Clonado o repositório monitor-discovery
```
# git clone https://github.com/madson7/monitor-discovery.git
 
# cd monitor-discovery
```
 
Build da imagem do Promotheus
```
# docker build -t madson7/prometheus_alpine ./dockerfiles/prometheus
```
Diretorios persistentes para o Zabbix
```
# mkdir -p \
    ./zbx_env/usr/lib/zabbix/alertscripts \
    ./zbx_env/usr/lib/zabbix/externalscripts \
    ./zbx_env/var/lib/zabbix/export \
    ./zbx_env/var/lib/zabbix/modules \
    ./zbx_env/var/lib/zabbix/enc \
    ./zbx_env/var/lib/zabbix/ssh_keys \
    ./zbx_env/var/lib/zabbix/mibs \
    ./zbx_env/var/lib/zabbix/snmptraps \
    ./zbx_env/var/lib/mysql
```
Deploy Stack com Docker Swarm
```
# docker stack deploy -c docker-compose.yml discovery
```
 
Status dos serviços
```
# docker service ls
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