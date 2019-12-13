docker-run:
	docker-compose -f docker-compose.yml up -d
	
docker-build:
	docker image build -t rtradetech/lotus-explorer:latest -f explorer.Dockerfile .
	docker image build -t rtradetech/lotus-node:latest -f node.Dockerfile .

docker-build-nocache: docker-build-nocache-node docker-build-nocache-explorer

docker-push:
	docker image push rtradetech/lotus-node:latest
	docker image push rtradetech/lotus-explorer:latest

docker-build-nocache-node:
	docker image build --no-cache -t rtradetech/lotus-node:latest -f node.Dockerfile .

docker-build-nocache-explorer:
	docker image build --no-cache  -t rtradetech/lotus-explorer:latest -f explorer.Dockerfile .