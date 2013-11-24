defmodule Mailme.Renderer.Dynamo do

  def render(conn, opts) do
    dynamo     = conn.main
    renderer   = dynamo.templates_server
    tmpl_paths = dynamo.templates_paths
    prelude    = fn -> dynamo.templates_prelude end
    template   = Dynamo.Templates.find!(opts[:template], tmpl_paths)

    assigns = Keyword.merge(conn.assigns, opts[:assigns])
    { [_conn], body } = Dynamo.Templates.render(renderer, template, [conn: conn], assigns, prelude)
    body
  end

end
