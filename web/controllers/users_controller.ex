defmodule Stalkme.UsersController do
  use Phoenix.Controller
  import Authme

  plug :action

  def index(conn, _params) do
    render conn, "index.html", current_user: current_user(conn)
  end

  def new(conn, _params) do
    render conn, "new.html", current_user: current_user(conn), csrf_token: get_session(conn, :csrf_token)
  end

  def show(conn, %{"id" => id}) do
    {id, _} = Integer.parse(id)
    render conn, "index.html", statuses: Status.for_user(id), current_user: current_user(conn)
  end

  def create(conn, %{"name" => name, "username" => username, "email" => email, "password" => password}) do
    password = password |> Authme.hash
    user = %User{name: name, username: username, email: email, password: password, created_at: Ecto.DateTime.local, updated_at: Ecto.DateTime.local}
    user = Repo.insert(user)
    conn = fetch_session(conn) |> put_session(:user_id, user.id)
    redirect conn, to: Stalkme.Router.Helpers.statuses_path(Stalkme, :index)
  end

end
