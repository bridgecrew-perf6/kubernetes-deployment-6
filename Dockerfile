## We specify the base image we need for our
## go application
FROM golang:latest

## We create an /app directory within our
## image that will hold our application source
## files
RUN mkdir /app

## We copy everything in the root directory
## into our /app directory
ADD . /app

## We specify that we now wish to execute 
## any further commands inside our /app
## directory
WORKDIR /app

## Add this go mod download command to pull in any dependencies
RUN go mod download

WORKDIR /app/cmd/gateway_svc

## we run go build to compile the binary
## executable of our Go program
RUN go build . 

## Our start command which kicks off
## our newly created binary executable
CMD ["/app/cmd/gateway_svc/gateway_svc"]