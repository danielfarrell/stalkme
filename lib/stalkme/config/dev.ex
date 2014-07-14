defmodule Stalkme.Config.Dev do
  use Stalkme.Config

  config :router, port: 4000,
                  ssl: false,
                  # Full error reports are enabled
                  consider_all_requests_local: true

  config :plugs, cookies: true, code_reload: true

  config :cookies, key: "_stalkme", secret: "wejhfi34uh9rugh94t3h49ufh9u4hffj9ugh9fniunidufniunfiugdnfitugh9dfgh9u4hg"

  config :logger, level: :debug
end


