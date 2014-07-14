defmodule Stalkme.Controllers.Users do
  use Phoenix.Controller
  import Authme

  def index(conn, _params) do
    render conn, "index", current_user: current_user(conn)
  end

  def new(conn, _params) do
    render conn, "new", current_user: current_user(conn)
  end

  def show(conn, %{"id" => id}) do
    {id, _} = Integer.parse(id)
    render conn, "index", statuses: Status.for_user(id), current_user: current_user(conn)
  end

  def create(conn, %{"name" => name, "username" => username, "email" => email, "password" => password}) do
    password = password |> Authme.hash
    user = %User{name: name, username: username, email: email, password: password, created_at: Now.datetime, updated_at: Now.datetime}
    user = Repo.insert(user)
    #UsersMailer.signup(conn, user)
    conn = fetch_session(conn) |> put_session(:user_id, user.id)
    redirect conn, "/"
  end

end
