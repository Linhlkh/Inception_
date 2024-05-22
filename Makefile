GREEN			=	$'\e[32m
END				=	$'\e[0m

all:
	@if [ -d "/home/khle/data/wordpress" ] && [ -d "/home/khle/data/mariadb" ] ; then \
		echo "$(GREEN) Volumes are already created$(END)";\
	else \
		mkdir -p /home/khle/data/wordpress; \
		mkdir -p /home/khle/data/mariadb; \
		echo "$(GREEN) Volumes have been successfully created$(END)";\
	fi
	@sudo docker-compose -f ./srcs/docker-compose.yml up -d

clean:
	sudo docker-compose -f ./srcs/docker-compose.yml down --rmi all -v
	sudo docker system prune -af

fclean: clean
	@if [ -d "/home/khle/data/wordpress" ]; then \
	sudo rm -rf /home/khle/data/wordpress/*; \
	fi

	@if [ -d "/home/khle/data/mariadb" ]; then \
	sudo rm -rf /home/khle/data/mariadb/*; \
	fi

	sudo docker volume rm $(docker volume ls -q)
	sudo docker network rm inception

re: fclean all

.PHONY: all, clean, fclean, re