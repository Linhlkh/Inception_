all:
	sudo docker compose -f ./srcs/docker-compose.yml up -d

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v
	sudo docker system prune -af

fclean: clean
	@if [ -d "/home/khle/data/wordpress" ]; then \
	sudo rm -rf /home/khle/data/wordpress/*; \
	fi;

	@if [ -d "/home/khle/data/mariadb" ]; then \
	sudo rm -rf /home/khle/data/mariadb/*; \
	fi;

re: fclean all

.PHONY: all, clean, fclean, re