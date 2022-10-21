FAUSTGH="ghcr.io/orlarey/faust"

image:
	docker build -t $(FAUSTGH):latest .

push:
	docker push $(FAUSTGH):latest

test:
	docker run $(FAUSTGH):latest

help:
	@echo " 'image' : builds the docker image"
	@echo " 'test'  : run the docker image, equivalent to faust -v"
	@echo " 'push'  : push the docker image to docker repository"
 