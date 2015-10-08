defmodule Stalkme.Status do
  use Stalkme.Web, :model

  alias Stalkme.Repo

  schema "statuses" do
    field :text,       :string
    field :created_at, Ecto.DateTime
    belongs_to :user, Stalkme.User
  end

  @required_fields ~w(text)
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

  def recent(params) do
    from(s in Stalkme.Status)
      |> order_by([s], desc: s.created_at)
      |> preload(:user)
      |> Repo.paginate(params)
  end

  def for_user(user_id, params) do
    from(s in Stalkme.Status)
      |> where([s], s.user_id == ^user_id)
      |> order_by([s], desc: s.created_at)
      |> preload(:user)
      |> Repo.paginate(params)
  end

  def find(status_id) do
    from(s in Stalkme.Status)
      |> where([s], s.id == ^status_id)
      |> limit([s], 1)
      |> preload(:user)
      |> Repo.all
      |> List.first
  end

end
