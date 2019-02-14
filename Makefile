.PHONY: build-pex
.DEFAULT_GOAL : build-pex
CONTAINER = hello-service
PORTS = -p 5001:5000
VOLUMES = -v $$(pwd):/code
DOCKER_RUN = docker run -e PEX_SCRIPT=gunicorn --rm -it $(VOLUMES) $(PORTS) $(CONTAINER)

docker-build build:  ## Build Docker container
	docker build -t $(CONTAINER) .

clean:
	rm -rf dist *.pex
	-docker stop $(CONTAINER)
	-docker rm $(CONTAINER)

pex:
	python setup.py sdist
	pex -vv -r requirements.txt -D . -o ./hello-service.pex
	PEX_SCRIPT=gunicorn ./hello-service.pex hello_service.main:app -b :8000

pex-docker:
	$(DOCKER_RUN) python3 setup.py sdist
	$(DOCKER_RUN) pex -vv -r requirements.txt -D . -o ./hello-service.pex
	$(DOCKER_RUN) ./hello-service.pex hello_service.main:app -b :8000
