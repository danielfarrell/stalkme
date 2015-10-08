defmodule Stalkme.SessionsController do
  use Stalkme.Web, :controller

  alias Stalkme.User

  def new(conn, _params) do
    render conn, "new.html", csrf_token: get_session(conn, :csrf_token)
  end

  def create(conn, %{"username" => username, "password" => password}) do
    user = User.login(username, password)
    conn = fetch_session(conn) |> put_session(:user_id, user.id)
    redirect conn, to: Stalkme.Router.Helpers.statuses_path(Stalkme, :index)
  end

  def destroy(conn, _params) do
    conn = fetch_session(conn) |> put_session(:user_id, nil)
    redirect conn, to: Stalkme.Router.Helpers.statuses_path(Stalkme, :index)
  end

end
