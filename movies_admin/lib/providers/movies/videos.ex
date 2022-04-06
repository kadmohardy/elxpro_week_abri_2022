defmodule Providers.Movies.Videos do
  @moduledoc """
  Implements the Videos Adapter behaviour uppon APIs.
  """
  @behaviour MoviesAdmin.Catalogue.VideosAdapter

  require Logger
  alias MoviesAdmin.Catalogue.Video

  alias Providers.Movies.Client

  @impl true
  def get_video(id) do
    Logger.info("Get video for id #{id} on microservice movies")

    id
    |> Client.get_video()
    |> handle_response()
  end

  defp handle_response({:ok, movie}) do
    {:ok, Video.new(movie)}
  end

  defp handle_response(error) do
    error
  end
end
