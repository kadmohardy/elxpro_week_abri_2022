defmodule MoviesAdmin.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      MoviesAdmin.Repo,
      # Start the Telemetry supervisor
      MoviesAdminWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MoviesAdmin.PubSub},
      # Start the Endpoint (http/https)
      MoviesAdminWeb.Endpoint
      # Start a worker by calling: MoviesAdmin.Worker.start_link(arg)
      # {MoviesAdmin.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MoviesAdmin.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MoviesAdminWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
