defmodule Mailer do
  use Mailme.Mailer, from: "notifications@stalkme.com"

  def signup(user) do
    send to: user.email, subject: "Welcome to Stalkme!", body: render("users/signup", assigns: [user: user])
  end

end
