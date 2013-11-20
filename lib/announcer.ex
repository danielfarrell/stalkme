defmodule Announcer do
  use GenEvent.Behaviour

  def handle_event({:status, status_id}, statuses) do
    s = Statuses.find(status_id)
    m = EEx.eval_file "web/templates/statuses/_status.html.eex", assigns: [status: s]
    pids = ConnectionKeeper.call(:all)
    pids |> announce(m)
    { :ok, [status_id|statuses] }
  end

  def announce([], _message), do: []
  def announce([pid|connections], message) do
    pid <- { :message, message }
    announce(connections, message)
  end

end
