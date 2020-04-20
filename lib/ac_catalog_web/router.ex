defmodule AcCatalogWeb.Router do
  use AcCatalogWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_root_layout, {AcCatalogWeb.LayoutView, :root}
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
  end

  scope "/", AcCatalogWeb do
    pipe_through :browser

    get "/", PageController, :index

    # resources "/furnitures", FurnitureController

    get "/furniture/housewares", FurnitureController, :housewares
    get "/furniture/floors", FurnitureController, :floors
    get "/furniture/miscellaneous", FurnitureController, :miscellaneous
    get "/furniture/music", FurnitureController, :music
    get "/furniture/rugs", FurnitureController, :rugs
    get "/furniture/wall_mounted", FurnitureController, :wall_mounted
    get "/furniture/wallpaper", FurnitureController, :wallpaper

    get "/clothing/accessories", ClothingController, :accessories
    get "/clothing/bags", ClothingController, :bags
    get "/clothing/bottoms", ClothingController, :bottoms
    get "/clothing/dresses", ClothingController, :dresses
    get "/clothing/headwear", ClothingController, :headwear
    get "/clothing/shoes", ClothingController, :shoes
    get "/clothing/socks", ClothingController, :socks
    get "/clothing/tops", ClothingController, :tops
    get "/clothing/umbrellas", ClothingController, :umbrellas
  end

  scope "/", AcCatalogWeb do
    pipe_through [:browser, :protected]

    # Add your protected routes here
  end

  # Other scopes may use custom stacks.
  # scope "/api", AcCatalogWeb do
  #   pipe_through :api
  # end
end
