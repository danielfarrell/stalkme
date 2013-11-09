defmodule User do
  use Ecto.Model

  queryable "users" do
    field :name,     :string
    field :email,    :string
    field :password, :string
    has_many :statuses, Status
  end
end

defmodule UserLogin do
  import Ecto.Query

  def login(email, password) do
    query = from u in User, where: u.email == ^email and u.password == ^password, limit: 1
    Stalkme.Repo.all(query) |> Enum.first
  end
end