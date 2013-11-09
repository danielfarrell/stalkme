defmodule SessionsRouter do
  use Dynamo.Router

  get "/new" do
    render conn, "sessions/new.html"
  end

  post "/" do
    user = UserLogin.login(conn.params[:email], conn.params[:password])
    conn = put_session(conn, :user_id, user.id)
    conn.resp 200, "Logged in as: #{user.id}"
  end

  delete "/:id" do
  end
end
