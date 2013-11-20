defmodule Websocket.Handler do
  use Websocket.Behaviour

  def websocket_init(_transport_name, req, _opts) do
    ConnectionKeeper.add(self)
    { :ok, req, :no_state }
  end

  def websocket_terminate(_reason, _req, _state) do
    ConnectionKeeper.remove(self)
    :ok
  end

end
