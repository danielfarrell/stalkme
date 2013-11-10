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

  @per_page 30
  def recent(page // 1) do
    query = from s in Status,
      order_by: [desc: s.created_at],
      limit: @per_page,
      offset: skip(page),
      preload: [:user]
    Stalkme.Repo.all(query)
  end

  def for_user(user_id, page // 1) do
    query = from s in Status,
      where: s.user_id == ^user_id,
      order_by: [desc: s.created_at],
      limit: @per_page,
      offset: skip(page),
      preload: [:user]
    Stalkme.Repo.all(query)
  end

  defp skip(1), do: 0
  defp skip(page) when page < 1, do: 0
  defp skip(page), do: (page - 1) * @per_page

end
