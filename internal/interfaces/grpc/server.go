package grpc

import (
	"fmt"
	"net"

	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"

	gamev1 "mini-mud/api/proto/game/v1"
	"mini-mud/internal/interfaces/grpc/handler"
)

// Server represents the gRPC server.
type Server struct {
	grpcServer  *grpc.Server
	gameHandler *handler.GameHandler
	port        int
}

// NewServer creates a new gRPC server.
func NewServer(gameHandler *handler.GameHandler, port int) *Server {
	grpcServer := grpc.NewServer()
	gamev1.RegisterGameServiceServer(grpcServer, gameHandler)

	// Enable reflection for debugging tools like grpcurl
	reflection.Register(grpcServer)

	return &Server{
		grpcServer:  grpcServer,
		gameHandler: gameHandler,
		port:        port,
	}
}

// Start starts the gRPC server.
func (s *Server) Start() error {
	lis, err := net.Listen("tcp", fmt.Sprintf(":%d", s.port))
	if err != nil {
		return fmt.Errorf("failed to listen: %w", err)
	}

	return s.grpcServer.Serve(lis)
}

// Stop stops the gRPC server gracefully.
func (s *Server) Stop() {
	s.grpcServer.GracefulStop()
}
