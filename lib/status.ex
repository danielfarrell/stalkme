defmodule Status do
  use Ecto.Model

  queryable "statuses" do
    field :text,        :string
    field :created_at,  :datetime
    belongs_to :user, User
  end
end

defmodule Statuses do
  import Ecto.Query

  def recent do
    query = from s in Status, order_by: s.created_at, limit: 30, preload: [:user]
    Stalkme.Repo.all(query)
  end
end