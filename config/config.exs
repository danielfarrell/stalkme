# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :stalkme, Stalkme.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "wejhfi34uh9rugh94t3h49ufh9u4hffj9ugh9fniunidufniunfiugdnfitugh9dfgh9u4hg",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Stalkme.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :joken, config_module: Guardian.JWT

config :guardian, Guardian,
  issuer: "Stalkme",
  ttl: { 30, :days },
  verify_issuer: true,
  secret_key: "dsfjoweifj0ew9fj0934jt9308th94hf9uehg9dufgh",
  serializer: Stalkme.GuardianSerializer
