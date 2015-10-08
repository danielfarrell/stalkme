defmodule Stalkme.PagesController do
  use Stalkme.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
