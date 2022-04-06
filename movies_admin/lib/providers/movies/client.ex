defmodule Providers.Movies.Client do
  # stub that we use to communicate
  alias VideosApi.VideoService.Stub

  # proto generated modules that were going to use
  alias VideosApi.{
    GetVideoRequest,
    GetVideoResponse,
    Video
  }

  @movies_service_url "localhost:50051"

  @spec get_video(Integer.t()) :: {:ok, Video.t()} | {:error, any}
  def get_video(id) do
    # 6. Establish a connection with gRPC server and return GRPC.Channel needed for sending requests.
    with {:ok, channel} <- GRPC.Stub.connect(@movies_service_url),
         # 7. build request struct
         {:ok, %GetVideoRequest{} = request} <- build_request(id),
         # 8. call rpc method in remote server by passing channel and request parameter
         # you can also pass options for timeout and deadline
         {:ok, %GetVideoResponse{video: video}} <-
           Stub.get(channel, request),
         do: build_response(video)
  end

  defp build_request(id), do: {:ok, GetVideoRequest.new(id: String.to_integer(id))}

  defp build_response(%Video{} = video),
    do: {:ok, %{id: video.id, title: video.title, description: video.description}}
end
