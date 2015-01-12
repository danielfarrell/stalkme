defmodule Stalkme.StatusesController do
  use Phoenix.Controller
  import Authme

  plug :action

  def index(conn, _params) do
    render conn, "index.html", statuses: Status.recent, current_user: current_user(conn), csrf_token: get_session(conn, :csrf_token)
  end

  def new(conn, _params) do
    authenticate_user(conn)
    render conn, "new.html", current_user: current_user(conn), csrf_token: get_session(conn, :csrf_token)
  end

  def create(conn, %{"text" => text}) do
    authenticate_user(conn)
    user_id = fetch_session(conn) |> get_session(:user_id)
    status = %Status{text: text, user_id: user_id, created_at: Ecto.DateTime.local}
    status = Repo.insert(status)
    Stalkme.LiveChannel.announce(status.id)
    #spawn(fn ->  end)
    render conn, "show.html", current_user: current_user(conn)
  end

end
