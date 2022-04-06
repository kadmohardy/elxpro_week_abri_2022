defmodule MoviesAdmin.Repo do
  use Ecto.Repo,
    otp_app: :movies_admin,
    adapter: Ecto.Adapters.Postgres
end
