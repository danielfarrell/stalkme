defmodule Stalkme.User do
  use Stalkme.Web, :model

  alias Stalkme.Repo

  schema "users" do
    field :name,       :string
    field :username,   :string
    field :email,      :string
    field :password,   :string
    field :created_at, Ecto.DateTime
    field :updated_at, Ecto.DateTime
    has_many :statuses, Stalkme.Status
  end

  @required_fields ~w(name username email password)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def login(username, password) do
    password = Authme.hash(password)
    query = from u in User, where: u.username == ^username and u.password == ^password, limit: 1
    query |> Repo.all |> List.first
  end
end
