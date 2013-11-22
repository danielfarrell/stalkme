defmodule Stalkme.Mixfile do
  use Mix.Project

  def project do
    [ app: :stalkme,
      version: "0.0.1",
      dynamos: [Stalkme.Dynamo, Websocket.Router],
      compilers: [:elixir, :dynamo, :app],
      env: [prod: [compile_path: "ebin"]],
      compile_path: "tmp/#{Mix.env}/stalkme/ebin",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { Stalkme, [] } ]
  end

  defp deps do
    [ { :cowboy, "~> 0.9.0", github: "extend/cowboy" },
      { :dynamo, "0.1.0-dev", github: "elixir-lang/dynamo" },
      { :postgrex, "~> 0.2.0", github: "ericmj/postgrex" },
      { :ecto, github: "elixir-lang/ecto" } ]
  end
end
