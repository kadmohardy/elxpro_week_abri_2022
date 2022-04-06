defmodule MoviesAdmin.Catalogue.VideosAdapter do
  alias MoviesAdmin.Catalogue.Video

  @callback get_video(access_token :: integer()) ::
              {:ok, video :: Video.t()}
              | {:error, reason :: any()}
end
