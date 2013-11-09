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

end