defmodule AcCatalogWeb.FurnitureController do
  use AcCatalogWeb, :controller

  alias AcCatalog.Furnitures
  alias AcCatalog.Furnitures.Furniture

  def index(conn, _params) do
    furnitures = Furnitures.list_furnitures()
    render(conn, "index.html", furnitures: furnitures)
  end

  def housewares(conn, _params) do
    housewares = Furnitures.list_housewares()
    render(conn, "index.html", furnitures: housewares, category: "Housewares")
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
