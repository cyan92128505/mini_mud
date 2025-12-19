# Build stage
FROM golang:1.24-alpine AS builder

WORKDIR /app

# Install protoc and plugins
RUN apk add --no-cache protobuf protobuf-dev make

# Copy go mod files
COPY go.mod go.sum ./
RUN go mod download

# Copy source code
COPY . .

# Generate protobuf
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
RUN make proto

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o /mini-mud ./cmd/server

# Final stage
FROM alpine:latest

RUN apk --no-cache add ca-certificates

WORKDIR /app

COPY --from=builder /mini-mud .
COPY configs/config.yaml ./configs/

EXPOSE 50051

CMD ["./mini-mud"]
