defmodule Announcer do
  use GenServer.Behaviour

  def start_link do
    :gen_server.start_link({:global, __MODULE__}, __MODULE__, [], [])
  end

  def handle_cast({:add, pid}, connections) do
    { :noreply, [pid|connections] }
  end

  def handle_cast({:remove, pid}, connections) do
    { :noreply, Enum.drop_while(connections, fn (p) -> p == pid end) }
  end

  def handle_cast({:announce, {:status, status_id}}, connections) do
    spawn fn ->
      s = Statuses.find(status_id)
      m = EEx.eval_file "web/templates/statuses/_status.html.eex", assigns: [status: s]
      connections |> send_all(m)
    end
    { :noreply, connections }
  end

  def add(pid) do
    cast({:add, pid})
  end

  def remove(pid) do
    cast({:remove, pid})
  end

  def announce(message) do
    cast({:announce, message})
  end

  def cast(message) do
    :gen_server.cast({:global, __MODULE__}, message)
  end

  def call(message) do
    :gen_server.call({:global, __MODULE__}, message)
  end

  def send_all([], _message), do: []
  def send_all([pid|connections], message) do
    pid <- { :message, message }
    send_all(connections, message)
  end

end
