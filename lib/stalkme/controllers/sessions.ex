defmodule Stalkme.Controllers.Sessions do
  use Phoenix.Controller
  import Authme

  def new(conn, _params) do
    render conn, "new", current_user: current_user(conn)
  end

  def create(conn, %{"username" => username, "password" => password}) do
    user = User.login(username, password)
    conn = fetch_session(conn) |> put_session(:user_id, user.id)
    redirect conn, "/"
  end

  def destroy(conn, _params) do
    conn = fetch_session(conn) |> put_session(:user_id, nil)
    redirect conn, "/"
  end

end
