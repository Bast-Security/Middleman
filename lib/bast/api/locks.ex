defmodule Bast.Api.Locks do
  use Plug.Router

  alias Bast.Api.Status
  alias Bast.Door
  alias Bast.Repo

  plug :match
  plug :dispatch

  post "/register" do
    conn.body_params
    |> Door.create
    |> Repo.insert
    |> Status.status_from_crud(:create)
    |> Status.send_status(conn)
  end

  get "/challenge/:id" do
    Status.send_status(Status.not_implemented, conn)
  end

  put "/login/:id" do
    Status.send_status(Status.not_implemented, conn)
  end

  match _ do
    Status.send_status(Status.not_found, conn)
  end
end