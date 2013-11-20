defmodule Websocket.Handler do
  use Websocket.Behaviour

  def websocket_init(_transport_name, req, _opts) do
    Announcer.add(self)
    { :ok, req, :no_state }
  end

  def websocket_terminate(_reason, _req, _state) do
    Announcer.remove(self)
    :ok
  end

end
