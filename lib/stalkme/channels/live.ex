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
    msg = EEx.eval_file "lib/stalkme/templates/statuses/_status.html.eex", assigns: [status: s]
    broadcast "live", "updates", "update", msg
  end

end
