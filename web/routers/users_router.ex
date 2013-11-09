defmodule UsersRouter do
  use Dynamo.Router

  get "/" do
    render conn, "users/index.html"
  end

  get "/new" do
    render conn, "users/new.html"
  end

  post "/" do
    user = User.new(name: conn.params[:name], email: conn.params[:email], password: conn.params[:password])
    user = Stalkme.Repo.create(user)
    conn.resp 200, "Created user: #{user.id}"
  end
end
