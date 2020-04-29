defmodule AcCatalogWeb.Router do
  use AcCatalogWeb, :router
  use Pow.Phoenix.Router
  use Pow.Extension.Phoenix.Router,
    extensions: [PowResetPassword, PowEmailConfirmation]

  @csv_names Application.get_env(:ac_catalog, :app_vars)[:csv_names]

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_root_layout, {AcCatalogWeb.LayoutView, :root}
    plug NavigationHistory.Tracker, excluded_paths: [~r(/session.*), ~r(/reset-password.*/), ~r(/registration.*/), ~r(/confirm-email.*/), ~r(/clothing.*/), ~r(/furniture.*/)]
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
    pow_extension_routes()
  end

  scope "/", AcCatalogWeb do
    pipe_through :browser

    get "/", PageController, :index

    get "/owned_items/:shared_user_id", OwnedItemsController, :index, as: :shareable_link

    Enum.each(@csv_names, fn csv_name ->
      get "/#{AcCatalog.column_names_from(csv_name)}", ItemController, :index
    end)
  end

  scope "/", AcCatalogWeb do
    pipe_through [:browser, :protected]

    get "/owned_items/", OwnedItemsController, :index

    put "/owned_items/:module/add/:id", FurnitureController, :add
    put "/owned_items/:module/remove/:id", FurnitureController, :remove
  end

  # Other scopes may use custom stacks.
  # scope "/api", AcCatalogWeb do
  #   pipe_through :api
  # end
end
