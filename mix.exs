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
    [ { :cowboy, github: "extend/cowboy" },
      { :dynamo, github: "dynamo/dynamo", branch: "0.13" },
      { :postgrex, github: "ericmj/postgrex" },
      { :ecto, github: "elixir-lang/ecto" },
      { :gen_smtp, github: "Vagabond/gen_smtp" } ]
  end
end
