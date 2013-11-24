defmodule Mailme.Renderer.Simple do

  def render(opts) do
    EEx.eval_file "web/templates/" <> opts[:template] <> ".eex", assigns: opts[:assigns]
  end

end
