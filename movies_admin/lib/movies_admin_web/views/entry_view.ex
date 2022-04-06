defmodule MoviesAdminWeb.VideoView do
  use MoviesAdminWeb, :view

  alias MoviesAdmin.Catalogue.Video

  def render("show.json", %{video: video}) do
    %{
      id: video.id,
      title: video.title,
      description: video.description
    }
  end
end
