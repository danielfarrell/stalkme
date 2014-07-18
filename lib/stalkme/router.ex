defmodule Stalkme.Router do
  use Phoenix.Router
  use Phoenix.Router.Socket, mount: "/ws"

  plug Plug.Static, at: "/static", from: :stalkme

  get "/", Stalkme.Controllers.Statuses, :index
  get "/logout", Stalkme.Controllers.Sessions, :destroy
  resources "sessions", Stalkme.Controllers.Sessions
  resources "statuses", Stalkme.Controllers.Statuses
  resources "users", Stalkme.Controllers.Users

  channel "live", Stalkme.Channels.Live

end
