PWD = $(shell pwd)

docker-build:
	docker build -t kolibs/hometest:v1 -f docker/fedora_test.docker .

docker-run:
	docker run --name=hometest --rm -p "80:80" kolibs/hometest:v1 sh -c "cd /root/ ; python3 /root/install.py"
