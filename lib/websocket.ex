defmodule Websocket do
  use Application.Behaviour

  def start(_type, _args) do
    Websocket.Router.start_link
  end
end
