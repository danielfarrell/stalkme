defmodule SessionsRouter do
  use Dynamo.Router

  get "/new" do
    render conn, "sessions/new.html"
  end

  post "/" do
    user = User.login(conn.params[:email], conn.params[:password])
    conn = put_session(conn, :user_id, user.id)
    redirect conn, to: "/"
  end

  delete "/:id" do
  end

  get "/destroy" do
    conn = put_session(conn, :user_id, nil)
    redirect conn, to: "/"
  end
end
