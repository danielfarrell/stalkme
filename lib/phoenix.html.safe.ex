defimpl Phoenix.HTML.Safe, for: Ecto.DateTime do
  def to_iodata(d) do
    month = String.rjust("#{d.month}", 2, ?0)
    day = String.rjust("#{d.day}", 2, ?0)
    hour = String.rjust("#{d.hour}", 2, ?0)
    min = String.rjust("#{d.min}", 2, ?0)
    sec = String.rjust("#{d.sec}", 2, ?0)
    "#{d.year}-#{month}-#{day}T#{hour}:#{min}:#{sec}Z"
  end
end
