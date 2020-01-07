# Docker-compose setup for working in jupyter labs

This is a bare bones docker-compose setup for working in jupyter labs with an available postgresql server.
Jupyter labs runs in one container and the postgresql server in another. Both are available to the host machine at ports `8888` and `5432` respectively. See the docker-compose.yaml for details about the default postgresql user and their password and how to change these.

To get it up and running do the following:
* Clone this repo or copy its files into a new location
* Run `docker-compose build` to pull down the needed images
* Run `docker-compose up` to start the containers
* Grab the url provided in the output and paste it into a web-browser to get into your jupyter lab instance
* Save the url for later

You can add new files to the `notebooks` directory and they will be made available to the jupyter labs container. Any files added under the `notebooks` within jupyter labs will persist after stopping the container. The postgresql database persists as well but it kept as a docker volume so see the docker docs for specifics on working with it.

