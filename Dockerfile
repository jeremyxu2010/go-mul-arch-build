# Start from the latest golang base image
FROM golang:latest as go-builder

# Add Maintainer Info
LABEL maintainer="Jeremy Xu <jeremyxu2010@gmail.com>"

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source from the current directory to the Working Directory inside the container
COPY ./cmd ./cmd

# Build the Go app
RUN go build -o output/demo ./cmd

# Start from the latest alpine base image
FROM alpine:latest

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy execute file from go-builder
COPY --from=go-builder /app/output/demo /app/demo

# Set docker image command
CMD [ "/app/demo" ]


