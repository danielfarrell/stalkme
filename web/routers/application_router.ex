defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    conn = conn.fetch([:cookies, :params, :session])
    conn = conn.assign :layout, "main"
    conn = conn.assign :title, "Stalk Me!"
    conn = configure_session(conn, :path, "/")
    conn
  end

  get "/" do
    render conn, "index.html"
  end

  forward "/statuses", to: StatusesRouter
  forward "/users", to: UsersRouter
  forward "/sessions", to: SessionsRouter
end
