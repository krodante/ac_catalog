defmodule AcCatalogWeb.Router do
  use AcCatalogWeb, :router
  use Pow.Phoenix.Router
  use Pow.Extension.Phoenix.Router,
    extensions: [PowResetPassword, PowEmailConfirmation]

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_root_layout, {AcCatalogWeb.LayoutView, :root}
    plug NavigationHistory.Tracker, included_paths: [~r(/clothing.*), ~r(/furniture.*/), ~r(/owned_items.*/)]
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

    get "/furniture/housewares", FurnitureController, :housewares, as: :housewares
    get "/furniture/floors", FurnitureController, :floors, as: :floors
    get "/furniture/miscellaneous", FurnitureController, :miscellaneous, as: :miscellaneous
    get "/furniture/music", FurnitureController, :music, as: :music
    get "/furniture/rugs", FurnitureController, :rugs, as: :rugs
    get "/furniture/wall_mounted", FurnitureController, :wall_mounted, as: :wall_mounted
    get "/furniture/wallpaper", FurnitureController, :wallpaper, as: :wallpaper

    get "/clothing/accessories", ClothingController, :accessories, as: :accessories
    get "/clothing/bags", ClothingController, :bags, as: :bags
    get "/clothing/bottoms", ClothingController, :bottoms, as: :bottoms
    get "/clothing/dresses", ClothingController, :dresses, as: :dresses
    get "/clothing/headwear", ClothingController, :headwear, as: :headwear
    get "/clothing/shoes", ClothingController, :shoes, as: :shoes
    get "/clothing/socks", ClothingController, :socks, as: :socks
    get "/clothing/tops", ClothingController, :tops, as: :tops
    get "/clothing/umbrellas", ClothingController, :umbrellas, as: :umbrellas
  end

  scope "/", AcCatalogWeb do
    pipe_through [:browser, :protected]

    get "/owned_items/", OwnedItemsController, :index

    put "/clothing/:table_name/add/:id", ClothingController, :add
    put "/clothing/:table_name/remove/:id", ClothingController, :remove

    put "/furniture/:table_name/add/:id", FurnitureController, :add
    put "/furniture/:table_name/remove/:id", FurnitureController, :remove
  end

  # Other scopes may use custom stacks.
  # scope "/api", AcCatalogWeb do
  #   pipe_through :api
  # end
end
