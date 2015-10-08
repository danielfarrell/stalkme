defmodule Stalkme do
  use Application

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Start the endpoint when the application starts
      worker(Stalkme.Endpoint, []),
      # Start the Ecto repository
      worker(Stalkme.Repo, [])
      # Here you could define other workers and supervisors as children
      # worker(Stalkme.Worker, [arg1, arg2, arg3]),
    ]


    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Stalkme.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Stalkme.Endpoint.config_change(changed, removed)
    :ok
  end
end
