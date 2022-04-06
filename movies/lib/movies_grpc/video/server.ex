defmodule MoviesGrpc.Video.Server do
  @moduledoc """
  Video Service.
  Test by going to movies proto and running:
  `grpcurl -plaintext -proto videos_api/movies.proto -d '{"id": 1}' localhost:8080 videos_api.VideoService.GetVideo`
  """
  use GRPC.Server, service: VideosApi.VideoService.Service

  alias VideosApi.{
    GetVideoRequest,
    GetVideoResponse,
    Video
  }

  alias Movies.Catalogue.Videos, as: VideosRepo
  alias Movies.Catalogue.Video, as: VideoSchema

  require Logger

  def get(%GetVideoRequest{id: id}, _stream) do
    with video <- VideosRepo.get(id), do: build_response(video)
  end

  defp build_response(nil) do
    Logger.info("Did not find video")
    raise GRPC.RPCError, status: :not_found
  end

  defp build_response(%VideoSchema{} = video) do
    video_json = %{id: video.id, title: video.title, description: video.description}

    GetVideoResponse.new(video: Video.new(video_json))
  end
end
