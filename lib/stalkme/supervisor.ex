defmodule Stalkme.Supervisor do
  use Supervisor.Behaviour

  # A convenience to start the supervisor
  def start_link(stack) do
    :supervisor.start_link(__MODULE__, stack)
  end

  # The callback invoked when the supervisor starts
  def init(stack) do
    children = [ 
      worker(Announcer, []),
      worker(Repo, []),
      supervisor(Stalkme.Dynamo, [stack])
    ]
    supervise children, strategy: :one_for_one
  end
end
