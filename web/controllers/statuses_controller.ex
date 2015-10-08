defmodule Stalkme.StatusesController do
  use Stalkme.Web, :controller

  alias Stalkme.Repo
  alias Stalkme.Status

  def index(conn, params) do
    render conn, "index.html", statuses: Status.recent(params), csrf_token: get_session(conn, :csrf_token)
  end

  def new(conn, _params) do
    render conn, "new.html", csrf_token: get_session(conn, :csrf_token)
  end

  def create(conn, %{"text" => text}) do
    user_id = fetch_session(conn) |> get_session(:user_id)
    status = %Status{text: text, user_id: user_id, created_at: Ecto.DateTime.local}
    status = Repo.insert(status)
    Stalkme.LiveChannel.announce(status.id)
    #spawn(fn ->  end)
    render conn, "show.html"
  end

end
