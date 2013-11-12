defmodule Status do
  use Ecto.Model

  queryable "statuses" do
    field :text,        :string
    field :created_at,  :datetime
    belongs_to :user, User
  end
end
