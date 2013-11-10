defmodule ApplicationRouter do
  use Dynamo.Router
  import Authme

  prepare do
    conn = conn.fetch([:cookies, :params, :session])
    conn = configure_session(conn, :path, "/")
    conn = conn.assign :layout, "main"
    conn = conn.assign :title, "Stalk Me!"
    conn = conn.assign :current_user, current_user(conn)
    conn
  end

  get "/" do
    conn = conn.assign :statuses, Statuses.recent
    render conn, "statuses/index.html"
  end

  forward "/statuses", to: StatusesRouter
  forward "/users", to: UsersRouter
  forward "/sessions", to: SessionsRouter
end
