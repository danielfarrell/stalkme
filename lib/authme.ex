defmodule Authme do

  defmacro __using__(_) do
  end

  defmacro authenticate_user(conn) do
    quote do
      session = get_session(unquote(conn))
      unless session[:user_id] do
        halt! unquote(conn).status(401)
      end
    end
  end

  defmacro current_user(conn) do
    quote do
      session = get_session(unquote(conn))
      if session[:user_id] do
        Stalkme.Repo.get User, session[:user_id]
      else
        nil
      end
    end
  end

  def hash(string) do
    :crypto.hash(:md5, string) |> :base64.encode
  end

end
