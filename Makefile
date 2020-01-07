.PHONY: image start launch stop

JUPYTER_SERVICE ?= notebook
START_WAIT ?= 10

image:
	docker-compose build

server_url.txt: image
	docker-compose up -d
	sleep ${START_WAIT}
	(nocorrect docker-compose logs --tail 10 ${JUPYTER_SERVICE} 2>&1) | grep -o "http.*127.*" | sort | uniq > server_url.txt

start: server_url.txt

launch: start
	cat server_url.txt | xargs open

stop:
	docker-compose down
	rm server_url.txt
