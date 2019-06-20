PWD = $(shell pwd)

docker-build:
	docker build -t maiste/hometest:v1 -f docker/fedora_test.docker .

docker-run:
	docker run --name=hometest --rm -p "80:80" maiste/hometest:v1 sh -c "cd /root/ ; python3 /root/install.py"
