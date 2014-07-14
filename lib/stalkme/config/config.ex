defmodule Stalkme.Config do
  use Phoenix.Config.App

  config :router, port: System.get_env("PORT")

  config :plugs, cookies: false, code_reload: false

  config :logger, level: :error
end
