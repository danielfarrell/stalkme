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

  @prepare :authenticate_user
  post "/" do
    session = get_session(conn)
    status = Status.new(text: conn.params[:text], user_id: session[:user_id], created_at: Now.datetime, updated_at: Now.datetime)
    status = Repo.create(status)
    Announcer.announce({:status, status.id})
    redirect conn, to: "/statuses"
  end
end
