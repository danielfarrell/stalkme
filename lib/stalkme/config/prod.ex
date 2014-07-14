defmodule Stalkme.Config.Prod do
  use Stalkme.Config

  config :router, port: System.get_env("PORT"),
                  ssl: false,
                  # Full error reports are disabled
                  consider_all_requests_local: false
                  # ip: {0, 0, 0, 0}

  config :plugs, cookies: true, code_reload: false

  config :cookies, key: "_stalkme", secret: "3j498rj5t98jeoifn49u5gwefj934fj93rhsdfoijf038jfijd9fijsd9ifj9f934hf9h9urhg9u"

  config :logger, level: :error
end


