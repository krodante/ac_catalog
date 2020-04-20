defmodule AcCatalogWeb.ClothingController do
  use AcCatalogWeb, :controller

  alias AcCatalog.Clothings
  alias AcCatalog.Clothings.Clothing

  def index(conn, _params) do
    clothings = Clothings.list_clothings()
    render(conn, "index.html", clothings: clothings)
  end

  def accessories(conn, _params) do
    accessories = AcCatalog.Accessories.list_accessories()
    render(conn, "index.html", clothing: accessories, category: "Accessories")
  end

  def bags(conn, _params) do
    bags = AcCatalog.Bags.list_bags()
    render(conn, "index.html", clothing: bags, category: "Bags")
  end

  def bottoms(conn, _params) do
    bottoms = AcCatalog.Bottoms.list_bottoms()
    render(conn, "index.html", clothing: bottoms, category: "Bottoms")
  end

  def dresses(conn, _params) do
    dresses = AcCatalog.Dresses.list_dresses()
    render(conn, "index.html", clothing: dresses, category: "Dresses")
  end

  def headwear(conn, _params) do
    headwear = AcCatalog.Headwears.list_headwears()
    render(conn, "index.html", clothing: headwear, category: "Headwear")
  end

  def shoes(conn, _params) do
    shoes = AcCatalog.Shoes.list_shoes()
    render(conn, "index.html", clothing: shoes, category: "Shoes")
  end

  def socks(conn, _params) do
    socks = AcCatalog.Socks.list_socks()
    render(conn, "index.html", clothing: socks, category: "Socks")
  end

  def tops(conn, _params) do
    tops = AcCatalog.Tops.list_tops()
    render(conn, "index.html", clothing: tops, category: "Tops")
  end

  def umbrellas(conn, _params) do
    umbrellas = AcCatalog.Umbrellas.list_umbrellas()
    render(conn, "index.html", clothing: umbrellas, category: "Umbrellas")
  end

  def new(conn, _params) do
    changeset = Clothings.change_clothing(%Clothing{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"clothing" => clothing_params}) do
    case Clothings.create_clothing(clothing_params) do
      {:ok, clothing} ->
        conn
        |> put_flash(:info, "Clothing created successfully.")
        |> redirect(to: Routes.clothing_path(conn, :show, clothing))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    clothing = Clothings.get_clothing!(id)
    render(conn, "show.html", clothing: clothing)
  end

  def edit(conn, %{"id" => id}) do
    clothing = Clothings.get_clothing!(id)
    changeset = Clothings.change_clothing(clothing)
    render(conn, "edit.html", clothing: clothing, changeset: changeset)
  end

  def update(conn, %{"id" => id, "clothing" => clothing_params}) do
    clothing = Clothings.get_clothing!(id)

    case Clothings.update_clothing(clothing, clothing_params) do
      {:ok, clothing} ->
        conn
        |> put_flash(:info, "Clothing updated successfully.")
        |> redirect(to: Routes.clothing_path(conn, :show, clothing))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", clothing: clothing, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    clothing = Clothings.get_clothing!(id)
    {:ok, _clothing} = Clothings.delete_clothing(clothing)

    conn
    |> put_flash(:info, "Clothing deleted successfully.")
    |> redirect(to: Routes.clothing_path(conn, :index))
  end
end
