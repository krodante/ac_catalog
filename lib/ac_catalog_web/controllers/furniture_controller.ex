defmodule AcCatalogWeb.FurnitureController do
  use AcCatalogWeb, :controller

  alias AcCatalog.Furnitures
  alias AcCatalog.Furnitures.Furniture

  def index(conn, _params) do
    furnitures = Furnitures.list_furnitures()
    render(conn, "index.html", furnitures: furnitures)
  end

  def housewares(conn, _params) do
    housewares = AcCatalog.Housewares.list_housewares()
    render(conn, "index.html", furnitures: housewares, category: "Housewares")
  end

  def floors(conn, _params) do
    floors = AcCatalog.Floors.list_floors()
    render(conn, "index.html", furnitures: floors, category: "Floors")
  end

  def miscellaneous(conn, _params) do
    miscellaneous = AcCatalog.MiscFurnitures.list_misc_furnitures()
    render(conn, "index.html", furnitures: miscellaneous, category: "Miscellaneous")
  end

  def music(conn, _params) do
    music = AcCatalog.Musics.list_musics()
    render(conn, "index.html", furnitures: music, category: "Music")
  end

  def rugs(conn, _params) do
    rugs = AcCatalog.Rugs.list_rugs()
    render(conn, "index.html", furnitures: rugs, category: "Rugs")
  end

  def wall_mounted(conn, _params) do
    wall_mounteds = AcCatalog.WallMounteds.list_wall_mounteds()
    render(conn, "index.html", furnitures: wall_mounteds, category: "Wall-Mounted")
  end

  def wallpaper(conn, _params) do
    wallpapers = AcCatalog.Wallpapers.list_wallpapers()
    render(conn, "index.html", furnitures: wallpapers, category: "Wallpaper")
  end

  def new(conn, _params) do
    changeset = Furnitures.change_furniture(%Furniture{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"furniture" => furniture_params}) do
    case Furnitures.create_furniture(furniture_params) do
      {:ok, furniture} ->
        conn
        |> put_flash(:info, "Furniture created successfully.")
        |> redirect(to: Routes.furniture_path(conn, :show, furniture))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    furniture = Furnitures.get_furniture!(id)
    render(conn, "show.html", furniture: furniture)
  end

  def edit(conn, %{"id" => id}) do
    furniture = Furnitures.get_furniture!(id)
    changeset = Furnitures.change_furniture(furniture)
    render(conn, "edit.html", furniture: furniture, changeset: changeset)
  end

  def update(conn, %{"id" => id, "furniture" => furniture_params}) do
    furniture = Furnitures.get_furniture!(id)

    case Furnitures.update_furniture(furniture, furniture_params) do
      {:ok, furniture} ->
        conn
        |> put_flash(:info, "Furniture updated successfully.")
        |> redirect(to: Routes.furniture_path(conn, :show, furniture))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", furniture: furniture, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    furniture = Furnitures.get_furniture!(id)
    {:ok, _furniture} = Furnitures.delete_furniture(furniture)

    conn
    |> put_flash(:info, "Furniture deleted successfully.")
    |> redirect(to: Routes.furniture_path(conn, :index))
  end
end
