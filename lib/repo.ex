defmodule Repo do
  use Ecto.Repo,
    otp_app: :stalkme,
    adapter: Ecto.Adapters.Postgres

  def priv do
    app_dir(:stalkme, "priv/repo")
  end
end
