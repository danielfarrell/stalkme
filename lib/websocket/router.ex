defmodule Websocket.Router do
  use Dynamo
  use Dynamo.Router

  config :dynamo, templates_paths: [ Path.expand("../websocket", __FILE__) ]
  config :server,
    port: 3030,
    dispatch: [{ :_, [
      {"/websocket", Websocket.Handler, [] },
      {:_, Dynamo.Cowboy.Handler, __MODULE__ }
    ] }]

  get "/" do
    render conn, "index.html"
  end
end
