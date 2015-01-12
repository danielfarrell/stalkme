defmodule Stalkme.Endpoint do
  use Phoenix.Endpoint, otp_app: :stalkme

  plug Plug.Static,
    at: "/", from: :stalkme

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_stalkme_key",
    signing_salt: "wueqyx/7",
    encryption_salt: "ihUSISgR"

  plug :router, Stalkme.Router
end
