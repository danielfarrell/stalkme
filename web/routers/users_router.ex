defmodule UsersRouter do
  use Dynamo.Router

  get "/" do
    render conn, "users/index.html"
  end

  get "/new" do
    render conn, "users/new.html"
  end

  get "/:id" do
    {id, _} = Integer.parse(id)
    conn = conn.assign :statuses, Statuses.for_user(id)
    render conn, "statuses/index.html"
  end

  post "/" do
    password = conn.params[:password] |> Authme.hash
    user = User.new(name: conn.params[:name], username: conn.params[:username], email: conn.params[:email], password: password, created_at: Now.datetime, updated_at: Now.datetime)
    user = Repo.insert(user)
    UsersMailer.signup(conn, user)
    conn = put_session(conn, :user_id, user.id)
    redirect conn, to: "/"
  end
end
