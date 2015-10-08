defmodule Stalkme.Router do
  use Stalkme.Web, :router

  pipeline :browser_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  scope "/", Stalkme do
    pipe_through [:browser, :browser_session] # Use the default browser stack

    get "/", StatusesController, :index
    get "/logout", SessionsController, :destroy
    resources "sessions", SessionsController
    resources "statuses", StatusesController
    resources "users", UsersController
  end

  # Other scopes may use custom stacks.
  scope "/api", Stalkme.Api do
    pipe_through [:api]
  end
end
