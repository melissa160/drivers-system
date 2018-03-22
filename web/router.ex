defmodule Registering.Router do
  use Registering.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Registering do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/drivers", DriverController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Registering do
  #   pipe_through :api
  # end
end
