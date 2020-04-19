defmodule AcCatalogWeb.Router do
  use AcCatalogWeb, :router

  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_root_layout, {AcCatalogWeb.LayoutView, :root}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AcCatalogWeb do
    pipe_through :browser

    get "/", PageController, :index

    # resources "/registrations", UserController
    resources "/registrations", UserController, only: [:create, :new]

    get "/sign-in", SessionController, :new
    post "/sign-in", SessionController, :create
    delete "/sign-out", SessionController, :delete

    live "/furniture", FurnitureLive.Index
  end

  # Other scopes may use custom stacks.
  # scope "/api", AcCatalogWeb do
  #   pipe_through :api
  # end
end
