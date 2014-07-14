defmodule Stalkme.Channels.Live do
  use Phoenix.Channel

  def join(socket, "updates", _topic) do
    IO.puts "JOIN #{socket.channel}:#{socket.topic}"
    Announcer.add socket
    {:ok, socket}
  end

  def leave(socket, _topic) do
    IO.puts "LEAVE #{socket.channel}:#{socket.topic}"
    Announcer.remove socket
    socket
  end

  def event("update", socket, message) do
    broadcast socket, "update", content: message
    socket
  end

end
