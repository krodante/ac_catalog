defmodule AcCatalogWeb.OwnedItemsController do
  use AcCatalogWeb, :controller

  alias AcCatalog.Accounts.User

  plug :reload_user

  defp reload_user(conn, _opts) do
    config = Pow.Plug.fetch_config(conn)

    case Pow.Plug.current_user(conn, config) do
      nil -> conn
      user ->
        reloaded_user = AcCatalog.Repo.get!(AcCatalog.Accounts.User, user.id)

        Pow.Plug.assign_current_user(conn, reloaded_user, config)
    end
  end

  def index(conn, %{"shared_user_id" => user_id}) do
    user = AcCatalog.Repo.get!(User, user_id)

    furniture = AcCatalog.Furnitures.list_owned_furnitures(user)
    clothing = AcCatalog.Clothings.list_owned_clothing(user)

    render(conn, "index.html", items: furniture ++ clothing)
  end

  def index(conn, _params) do
    current_user = Pow.Plug.current_user(conn)

    furniture = AcCatalog.Furnitures.list_owned_furnitures(current_user)
    clothing = AcCatalog.Clothings.list_owned_clothing(current_user)

    render(conn, "index.html", items: furniture ++ clothing)
  end

end
