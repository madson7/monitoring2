# init
	docker swarm init
# start
	docker stack deploy -c docker-compose.yml discovery
# service
	docker service ls
	docker ps
	docker exec ID
# remove
	docker stack rm discovery
	docker rm $(docker ps -a -q)
	docker image rm $(docker image ls -a -q)
	docker volume prune

# (gera script)
docker exec -it <ID> /bin/bash
./metricbeat modules enable prometheus
./metricbeat setup
./metricbeat -e












wget https://repo.zabbix.com/zabbix/4.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.4-1+bionic_all.deb
dpkg -i zabbix-release_4.4-1+bionic_all.deb
apt update 

apt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-agent 

mysql -uroot -p

create database zabbix character set utf8 collate utf8_bin;
grant all privileges on zabbix.* to zabbix@localhost identified by 'zabbix';
quit;

zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql zabbix

DBPassword=123456

php_value date.timezone America/Bahia