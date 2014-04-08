defmodule UsersMailer do
  use Mailme.Mailer, from: "notifications@stalkme.com"

  def signup(conn, user) do
    send_mail conn, to: user.email, subject: "Welcome to Stalkme!", template: "users/signup.text", assigns: [user: user]
  end

end
