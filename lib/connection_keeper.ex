defmodule ConnectionKeeper do
  use GenServer.Behaviour

  def start_link do
    :gen_server.start_link({:global, __MODULE__}, __MODULE__, [], [])
  end

  def handle_call(:all, _from, connections) do
    { :reply, connections, connections }
  end

  def handle_cast({:add, pid}, connections) do
    { :noreply, [pid|connections] }
  end

  def handle_cast({:remove, pid}, connections) do
    { :noreply, Enum.drop_while(connections, fn (p) -> p == pid end) }
  end

  def add(pid) do
    cast({:add, pid})
  end

  def remove(pid) do
    cast({:remove, pid})
  end

  def cast(message) do
    :gen_server.cast({:global, __MODULE__}, message)
  end

  def call(message) do
    :gen_server.call({:global, __MODULE__}, message)
  end

end
