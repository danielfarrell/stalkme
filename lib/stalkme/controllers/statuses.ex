defmodule Stalkme.Controllers.Statuses do
  use Phoenix.Controller
  import Authme

  def index(conn, _params) do
    render conn, "index", statuses: Status.recent, current_user: current_user(conn)
  end

  def new(conn, _params) do
    authenticate_user(conn)
    render conn, "new", current_user: current_user(conn)
  end

  def create(conn, %{"text" => text}) do
    authenticate_user(conn)
    user_id = fetch_session(conn) |> get_session(:user_id)
    status = %Status{text: text, user_id: user_id, created_at: Now.datetime}
    status = Repo.insert(status)
    Announcer.announce({:status, status.id})
    #render conn, "show", current_user: current_user(conn)
    redirect conn, "/"
  end
end
