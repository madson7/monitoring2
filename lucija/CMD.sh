
	docker swarm init

	docker stack deploy -c docker-compose.yml teste

	docker service ls

	docker stack rm teste
	docker rm $(docker ps -a -q)
	docker image rm $(docker image ls -a -q)
	docker volume prune


docker exec -i -t nginx /bin/bash

nano /etc/nginx/conf.d/status.conf
nginx -t && nginx -s reload

curl 127.0.0.1:9090/nginx_status

docker build -t madson7/mysql .

docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=locate -e MYSQL_USER=user -e MYSQL_PASSWORD=12345678 madson7/mysql

docker exec -it container_id bash
mysql -uroot -p

SELECT * FROM worldmap_latlng;