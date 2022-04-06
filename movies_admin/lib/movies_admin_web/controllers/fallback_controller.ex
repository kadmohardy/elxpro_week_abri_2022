defmodule MoviesAdminWeb.FallbackController do
  use MoviesAdminWeb, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(MoviesAdminWeb.ErrorView)
    |> render("404.json")
  end

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(MoviesAdminWeb.ErrorView)
    |> render("422.json", changeset: changeset)
  end

  def call(conn, {:error, %GRPC.RPCError{}}) do
    conn
    |> put_status(:not_found)
    |> put_view(MoviesAdminWeb.ErrorView)
    |> render("404.json")
  end

  def call(conn, {:error, reason}) do
    IO.inspect(reason)

    conn
    |> put_status(:unprocessable_entity)
    |> put_view(MoviesAdminWeb.ErrorView)
    |> render("422.json", %{reason: reason})
  end
end
