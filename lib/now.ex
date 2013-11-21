defmodule Now do
  def datetime do
    {{year, month, day},{hour, min, sec}} = :erlang.universaltime
    Ecto.DateTime[year: year, month: month, day: day, hour: hour, min: min, sec: sec]
  end
end
