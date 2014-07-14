defmodule Announcer do
  use GenServer

  # Public API
  def add(pid) do
    cast({:add, pid})
  end

  def remove(pid) do
    cast({:remove, pid})
  end

  def announce(message) do
    cast({:announce, message})
  end

  # OTP API
  @server_name :announcer

  def start_link do
    :gen_server.start_link({:local, @server_name}, __MODULE__, [], [])
  end

  def handle_cast({:add, pid}, connections) do
    { :noreply, [pid|connections] }
  end

  def handle_cast({:remove, pid}, connections) do
    { :noreply, Enum.drop_while(connections, fn (p) -> p == pid end) }
  end

  def handle_cast({:announce, {:status, status_id}}, connections) do
    spawn fn ->
      s = Status.find(status_id)
      m = EEx.eval_file "lib/stalkme/templates/statuses/_status.html.eex", assigns: [status: s]
      connections |> send_all(m)
    end
    { :noreply, connections }
  end

  defp cast(message) do
    :gen_server.cast(@server_name, message)
  end

  defp call(message) do
    :gen_server.call(@server_name, message)
  end

  defp send_all([], _message), do: []
  defp send_all([pid|connections], message) do
    send pid, { :message, message }
    send_all(connections, message)
  end

end
