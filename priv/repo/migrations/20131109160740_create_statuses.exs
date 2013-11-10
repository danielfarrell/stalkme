defmodule Repo.Migrations.CreateStatuses do
  use Ecto.Migration

  def up do
    """
    CREATE TABLE statuses (
        id          serial PRIMARY KEY,
        user_id     integer NOT NULL,
        text        varchar(140) NOT NULL,
        created_at  timestamp
    );
    """
  end

  def down do
    "DROP TABLE statuses;"
  end
end
