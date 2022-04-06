defmodule MoviesAdminWeb.VideoController do
  use MoviesAdminWeb, :controller

  require Logger

  alias MoviesAdmin.Catalogue

  action_fallback MoviesAdminWeb.FallbackController

  def show(conn, _params = %{"id" => id}) do
    with {:ok, video} <- Catalogue.get_video(id) do
      conn
      |> put_status(:created)
      |> render("show.json", video: video)
    end
  end
end
