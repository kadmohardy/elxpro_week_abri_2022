defmodule MoviesGrpc.Endpoint do
  use GRPC.Endpoint

  intercept(GRPC.Logger.Server)
  run(MoviesGrpc.Video.Server)
end
