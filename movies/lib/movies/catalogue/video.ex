defmodule Movies.Catalogue.Video do
  use Ecto.Schema

  import Ecto.Changeset

  schema "videos" do
    field :title, :string
    field :description, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description])
    |> validate_required([:title])
  end
end
