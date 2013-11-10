defmodule Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def url do
    System.get_env("DATABASE_URL")
  end

  def priv do
    app_dir(:stalkme, "priv/repo")
  end
end
