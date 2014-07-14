defmodule Stalkme.Channels.Live do
  use Phoenix.Channel

  def join(socket, "updates", _topic) do
    IO.puts "JOIN #{socket.channel}:#{socket.topic}"
    {:ok, socket}
  end

  def leave(socket, _topic) do
    IO.puts "LEAVE #{socket.channel}:#{socket.topic}"
    socket
  end

  def announce(status_id) do
    s = Status.find(status_id)
    msg = Stalkme.Views.Statuses.render("_status.html", status: s) |> Phoenix.Html.Safe.to_string
    broadcast "live", "updates", "update", msg
  end

end
