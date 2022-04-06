defmodule Movies.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def up do
    create table(:videos) do
      add :title, :string
      add :description, :string

      timestamps()
    end
  end

  def down do
    drop table(:videos)
  end
end
