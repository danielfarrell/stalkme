defmodule StatusesRouter do
  use Dynamo.Router
  import Authme

  get "/" do
    conn = conn.assign :statuses, Statuses.recent
    render conn, "statuses/index.html"
  end

  @prepare :authenticate_user
  get "/new" do
    render conn, "statuses/new.html"
  end

  post "/" do
    session = get_session(conn)
    status = Status.new(text: conn.params[:text], user_id: session[:user_id])
    status = Stalkme.Repo.create(status)
    conn.resp 200, "Got status: #{conn.params[:text]}"
  end
end
