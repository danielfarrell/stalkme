defmodule Authme do

  defmacro authenticate_user(conn) do
    quote do
      user_id = fetch_session(unquote(conn)) |> get_session(:user_id)
      unless user_id do
        error(unquote(conn), unquote(conn).status(401))
      end
    end
  end

  defmacro current_user(conn) do
    quote do
      user_id = fetch_session(unquote(conn)) |> get_session(:user_id)
      if user_id do
        Repo.get User, user_id
      else
        nil
      end
    end
  end

  def hash(string) do
    :crypto.hash(:md5, string) |> :base64.encode
  end

end
