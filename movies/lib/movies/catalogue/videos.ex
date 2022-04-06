defmodule Movies.Catalogue.Videos do
  alias Movies.Repo

  alias Movies.Catalogue.Video

  def insert(attrs) do
    %Video{}
    |> Video.changeset(attrs)
    |> Repo.insert()
  end

  def get(id) do
    Repo.get(Video, id)
  end
end
