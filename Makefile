all:
	docker buildx build --rm -t go-mul-arch-build:latest-amd64 --platform=linux/amd64 --output=type=docker .
	docker buildx build --rm -t go-mul-arch-build:latest-arm64 --platform=linux/arm64 --output=type=docker .
