defmodule User do
  use Ecto.Model

  queryable "users" do
    field :name,       :string
    field :username,   :string
    field :email,      :string
    field :password,   :string
    field :created_at, :datetime
    field :updated_at, :datetime
    has_many :statuses, Status
  end

  def login(username, password) do
    password = Authme.hash(password)
    query = from u in User, where: u.username == ^username and u.password == ^password, limit: 1
    query |> Repo.all |> List.first
  end
end
