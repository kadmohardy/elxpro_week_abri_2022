defmodule MoviesAdmin.Catalogue.Video do
  defstruct id: nil,
            title: nil,
            description: nil

  @type t :: %__MODULE__{
          id: integer,
          title: binary,
          description: binary
        }

  def new(attrs) do
    struct(__MODULE__, attrs)
  end
end
