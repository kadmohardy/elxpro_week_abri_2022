defmodule MoviesAdmin.Catalogue do
  @videos_adapter Application.compile_env!(:movies_admin, [
                    MoviesAdmin.Catalogue,
                    :videos_adapter
                  ])

  def get_video(id), do: @videos_adapter.get_video(id)
end
