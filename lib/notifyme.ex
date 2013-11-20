defmodule Notifyme do

  def start_link do
    response = :gen_event.start_link({:global, __MODULE__})
    add_handler(Announcer)
    response
  end

  def add_handler(handler) do
    :gen_event.add_handler({:global, __MODULE__}, handler, [])
  end

  def delete_handler(handler) do
    :gen_event.delete_handler({:global, __MODULE__}, handler, [])
  end

  def notify(message) do
    :gen_event.notify({:global, __MODULE__}, message)
  end

  def call(handler, type) do
    :gen_event.call({:global, __MODULE__}, handler, type)
  end

end
