defmodule Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    """
    CREATE TABLE users (
        id          serial PRIMARY KEY,
        username    varchar(255) NOT NULL,
        name        varchar(255) NOT NULL,
        email       varchar(255) NOT NULL,
        password    varchar(255) NOT NULL,
        token       varchar(255) NOT NULL,
        created_at  timestamp,
        updated_at  timestamp
    );
    """
  end

  def down do
    "DROP TABLE users;"
  end
end
