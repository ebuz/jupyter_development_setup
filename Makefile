.PHONY: image start launch shell stop

WORKINGDIR ?= /Users/ebuz/projects/insight/notebooks
IMAGE ?= insight_dev
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

# shell:
# 	echo "#1/bin/sh" > launch_shell.sh
# 	echo "docker exec -it ${NAME} /bin/bash" >> launch_shell.sh
# 	chmod +x launch_shell.sh

stop:
	docker-compose down ${NAME}
	rm server_url.txt
	# rm launch_shell.sh
