all: build

clean:
	@docker rm -f `docker ps -a | grep "frodon1/debian:jessie-$(shell head -1 VERSION)" | awk '{print $$1}'` > /dev/null 2>&1 || exit 0
	@docker rmi `docker images  | grep "frodon1/debian:jessie-$(shell head -1 VERSION)" | awk '{print $$3}'` > /dev/null 2>&1 || exit 0


build:
	@docker build --rm=true --tag=frodon1/debian:jessie-$(shell head -1 VERSION)-$(shell tail -1 VERSION) .

bash: build
	docker run -it --rm frodon1/debian:jessie-$(shell head -1 VERSION)-$(shell tail -1 VERSION) $@
