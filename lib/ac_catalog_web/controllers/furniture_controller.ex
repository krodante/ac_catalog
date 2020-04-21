defmodule AcCatalogWeb.FurnitureController do
  use AcCatalogWeb, :controller

  alias AcCatalog.Furnitures
  alias AcCatalog.Furnitures.Furniture

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

  def category_for(table_name) do
    case table_name do
      "misc_furnitures" -> "miscellaneous"
      "floors" -> "floors"
      "housewares" -> "housewares"
      "musics" -> "music"
      "rugs" -> "rugs"
      "wall_mounteds" -> "wall_mounted"
      "wallpapers" -> "wallpaper"
    end
  end

  def add(conn, params) do
    table_name = params["table_name"]
    category = category_for(table_name)
    id = params["id"]
    current_user = conn.assigns.current_user

    table_name_column = String.to_atom("owned_#{table_name}_ids")

    owned_ids = Map.get(current_user, table_name_column)

    new_data = Map.new(
      [
        {table_name_column, owned_ids ++ [id]}
      ]
    )

    changeset = AcCatalog.Accounts.User.item_changeset(current_user, new_data)

    {:ok, _user} = AcCatalog.Repo.update(changeset)

    conn
    |> put_flash(:info, "Furniture updated successfully.")
    |> redirect(to: "/furniture/#{category}")
  end

  def remove(conn, params) do
    table_name = params["table_name"]
    category = category_for(table_name)
    id = String.to_integer(params["id"])
    current_user = conn.assigns.current_user

    table_name_column = String.to_atom("owned_#{table_name}_ids")

    owned_ids = Map.get(current_user, table_name_column)

    new_data = Map.new(
      [
        {table_name_column, owned_ids -- [id]}
      ]
    )

    changeset = AcCatalog.Accounts.User.item_changeset(current_user, new_data)

    {:ok, _user} = AcCatalog.Repo.update(changeset)

    conn
    |> put_flash(:info, "Furniture updated successfully.")
    |> redirect(to: "/furniture/#{category}")
  end

  def index(conn, _params) do
    furnitures = Furnitures.list_furnitures()
    render(conn, "index.html", furnitures: furnitures)
  end

  def housewares(conn, _params) do
    housewares = AcCatalog.Housewares.list_housewares()
    table_name = "housewares"
    render(conn, "index.html", furnitures: housewares, category: "housewares", table_name: table_name)
  end

  def floors(conn, _params) do
    floors = AcCatalog.Floors.list_floors()
    table_name = "floors"
    render(conn, "index.html", furnitures: floors, category: "floors", table_name: table_name)
  end

  def miscellaneous(conn, _params) do
    miscellaneous = AcCatalog.MiscFurnitures.list_misc_furniture()
    table_name = "misc_furnitures"
    render(conn, "index.html", furnitures: miscellaneous, category: "miscellaneous", table_name: table_name)
  end

  def music(conn, _params) do
    music = AcCatalog.Musics.list_musics()
    table_name = "musics"
    render(conn, "index.html", furnitures: music, category: "music", table_name: table_name)
  end

  def rugs(conn, _params) do
    rugs = AcCatalog.Rugs.list_rugs()
    table_name = "rugs"
    render(conn, "index.html", furnitures: rugs, category: "rugs", table_name: table_name)
  end

  def wall_mounted(conn, _params) do
    wall_mounteds = AcCatalog.WallMounteds.list_wall_mounteds()
    table_name = "wall_mounteds"
    render(conn, "index.html", furnitures: wall_mounteds, category: "wall-mounted", table_name: table_name)
  end

  def wallpaper(conn, _params) do
    wallpapers = AcCatalog.Wallpapers.list_wallpapers()
    table_name = "wallpapers"
    render(conn, "index.html", furnitures: wallpapers, category: "wallpaper", table_name: table_name)
  end

  def new(conn, _params) do
    changeset = Furnitures.change_furniture(%Furniture{})
    render(conn, "new.html", changeset: changeset)
  end

  # def create(conn, %{"furniture" => furniture_params}) do
  #   case Furnitures.create_furniture(furniture_params) do
  #     {:ok, furniture} ->
  #       conn
  #       |> put_flash(:info, "Furniture created successfully.")
  #       |> redirect(to: Routes.furniture_path(conn, :show, furniture))

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "new.html", changeset: changeset)
  #   end
  # end

  def show(conn, %{"id" => id}) do
    furniture = Furnitures.get_furniture!(id)
    render(conn, "show.html", furniture: furniture)
  end

  def edit(conn, %{"id" => id}) do
    furniture = Furnitures.get_furniture!(id)
    changeset = Furnitures.change_furniture(furniture)
    render(conn, "edit.html", furniture: furniture, changeset: changeset)
  end

  # def update(conn, %{"id" => id, "furniture" => furniture_params}) do
  #   furniture = Furnitures.get_furniture!(id)

  #   case Furnitures.update_furniture(furniture, furniture_params) do
  #     {:ok, furniture} ->
  #       conn
  #       |> put_flash(:info, "Furniture updated successfully.")
  #       |> redirect(to: Routes.furniture_path(conn, :show, furniture))

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "edit.html", furniture: furniture, changeset: changeset)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   furniture = Furnitures.get_furniture!(id)
  #   {:ok, _furniture} = Furnitures.delete_furniture(furniture)

  #   conn
  #   |> put_flash(:info, "Furniture deleted successfully.")
  #   |> redirect(to: Routes.furniture_path(conn, :index))
  # end
end
