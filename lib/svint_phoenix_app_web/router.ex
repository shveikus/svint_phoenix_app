defmodule SvintPhoenixAppWeb.Router do
  use SvintPhoenixAppWeb, :router
  use Pow.Phoenix.Router

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

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :admin do
    plug SvintPhoenixAppWeb.EnsureRolePlug, :admin
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
  end

  scope "/", SvintPhoenixAppWeb do
    pipe_through :browser
    get "/", PageController, :index
  end

  scope "/", SvintPhoenixAppWeb do
    pipe_through [:browser, :admin]
    get "/contact", PageController, :contact
  end
end
