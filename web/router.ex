defmodule Stalkme.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/", Stalkme do
    pipe_through :browser # Use the default browser stack

    get "/", StatusesController, :index
    get "/logout", SessionsController, :destroy
    resources "sessions", SessionsController
    resources "statuses", StatusesController
    resources "users", UsersController
  end

  socket "/ws", Stalkme do
    channel "live", LiveChannel
  end

end
