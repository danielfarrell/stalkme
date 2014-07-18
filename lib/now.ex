defmodule Now do
  def datetime do
    Ecto.DateTime.from_erl(:erlang.universaltime)
  end
end
