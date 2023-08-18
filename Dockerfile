
# Use the official Go image as a parent image
FROM golang:1.16

# Set the working directory
WORKDIR /go/src/app

# Copy backend code
COPY . .

# Conditionally initialize the Go module if go.mod does not exist
RUN if [ ! -f go.mod ]; then go mod init example.com/mymodule; fi

# Download dependencies, compile the Go application, and list the directory's contents
RUN go get -d -v ./...
RUN go build -o app .
RUN ls -al

# Start with a harmless command
CMD ["sleep", "infinity"]
