defmodule Stalkme.LiveChannel do
  use Phoenix.Channel

  def join(topic, _msg, socket) do
    IO.puts "JOIN #{topic}"
    {:ok, socket}
  end

  def leave(_msg, socket) do
    IO.puts "LEAVE #{socket.topic}"
    {:ok, socket}
  end

  def announce(status_id) do
    s = Status.find(status_id)
    msg = Phoenix.View.render_to_string(Stalkme.StatusesView, "_status.html",  status: s)
    broadcast "live", "updates:update", %{body: msg}
  end

  def handle_in(_channel, _msg, socket) do
    {:ok, socket}
  end

end
