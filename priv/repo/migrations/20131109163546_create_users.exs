defmodule Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    """
    CREATE TABLE users (
        id          serial PRIMARY KEY,
        name        varchar(255) NOT NULL,
        email       varchar(255) NOT NULL,
        password    varchar(255) NOT NULL,
        created_at  timestamp,
        updated_at  timestamp
    );
    """
  end

  def down do
    "DROP TABLE users;"
  end
end
