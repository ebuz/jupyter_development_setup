FROM postgres:latest

#COPY setup_scripts /docker-entrypoint-initdb.d/

VOLUME ["/var/log/postgresql"]

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["postgres"]
