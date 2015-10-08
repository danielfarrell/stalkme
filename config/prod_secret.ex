use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :stalkme, Stalkme.Endpoint,
  secret_key_base: "3j498rj5t98jeoifn49u5gwefj934fj93rhsdfoijf038jfijd9fijsd9ifj9f934hf9h9urhg9u"

# Configure your database
config :stalkme, Stalkme.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "talkme_prod",
  pool_size: 20
