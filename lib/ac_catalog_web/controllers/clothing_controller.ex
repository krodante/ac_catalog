defmodule AcCatalogWeb.ClothingController do
  use AcCatalogWeb, :controller

  alias AcCatalog.Clothings
  alias AcCatalog.Clothings.Clothing

  plug :reload_user

  defp reload_user(conn, _opts) do
    config        = Pow.Plug.fetch_config(conn)

    case Pow.Plug.current_user(conn, config) do
      nil -> conn
      user ->
        reloaded_user = AcCatalog.Repo.get!(AcCatalog.Accounts.User, user.id)

        Pow.Plug.assign_current_user(conn, reloaded_user, config)
    end
  end

  def add(conn, params) do
    category = params["category"]
    id = params["id"]
    current_user = conn.assigns.current_user

    category_column = String.to_atom("owned_#{category}_ids")

    owned_ids = Map.get(current_user, category_column)

    new_data = Map.new(
      [
        {category_column, owned_ids ++ [id]}
      ]
    )

    changeset = AcCatalog.Accounts.User.item_changeset(current_user, new_data)

    {:ok, _user} = AcCatalog.Repo.update(changeset)

    conn
    |> put_flash(:info, "Clothing updated successfully.")
    |> redirect(to: "/clothing/#{category}")
  end

  def remove(conn, params) do
    category = params["category"]
    id = String.to_integer(params["id"])
    current_user = conn.assigns.current_user

    category_column = String.to_atom("owned_#{category}_ids")

    owned_ids = Map.get(current_user, category_column)

    new_data = Map.new(
      [
        {category_column, owned_ids -- [id]}
      ]
    )

    changeset = AcCatalog.Accounts.User.item_changeset(current_user, new_data)

    {:ok, _user} = AcCatalog.Repo.update(changeset)

    conn
    |> put_flash(:info, "Clothing updated successfully.")
    |> redirect(to: "/clothing/#{category}")
  end

  def index(conn, _params) do
    clothings = Clothings.list_clothings()
    render(conn, "index.html", clothing: clothings)
  end

  def accessories(conn, _params) do
    accessories = AcCatalog.Accessories.list_accessories()
    table_name = "accessories"
    render(conn, "index.html", clothing: accessories, category: "accessories", table_name: table_name)
  end

  def bags(conn, _params) do
    bags = AcCatalog.Bags.list_bags()
    table_name = "bags"
    render(conn, "index.html", clothing: bags, category: "bags", table_name: table_name)
  end

  def bottoms(conn, _params) do
    bottoms = AcCatalog.Bottoms.list_bottoms()
    table_name = "bottoms"
    render(conn, "index.html", clothing: bottoms, category: "bottoms", table_name: table_name)
  end

  def dresses(conn, _params) do
    dresses = AcCatalog.Dresses.list_dresses()
    table_name = "dresses"
    render(conn, "index.html", clothing: dresses, category: "dresses", table_name: table_name)
  end

  def headwear(conn, _params) do
    headwear = AcCatalog.Headwears.list_headwears()
    table_name = "headwears"
    render(conn, "index.html", clothing: headwear, category: "headwear", table_name: table_name)
  end

  def shoes(conn, _params) do
    shoes = AcCatalog.Shoes.list_shoes()
    table_name = "shoes"
    render(conn, "index.html", clothing: shoes, category: "shoes", table_name: table_name)
  end

  def socks(conn, _params) do
    socks = AcCatalog.Socks.list_socks()
    table_name = "socks"
    render(conn, "index.html", clothing: socks, category: "socks", table_name: table_name)
  end

  def tops(conn, _params) do
    tops = AcCatalog.Tops.list_tops()
    table_name = "tops"
    render(conn, "index.html", clothing: tops, category: "tops", table_name: table_name)
  end

  def umbrellas(conn, _params) do
    umbrellas = AcCatalog.Umbrellas.list_umbrellas()
    table_name = "umbrellas"
    render(conn, "index.html", clothing: umbrellas, category: "umbrellas", table_name: table_name)
  end

  def new(conn, _params) do
    changeset = Clothings.change_clothing(%Clothing{})
    render(conn, "new.html", changeset: changeset)
  end

  # def create(conn, %{"clothing" => clothing_params}) do
  #   case Clothings.create_clothing(clothing_params) do
  #     {:ok, clothing} ->
  #       conn
  #       |> put_flash(:info, "Clothing created successfully.")
  #       |> redirect(to: Routes.clothing_path(conn, :show, clothing))

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "new.html", changeset: changeset)
  #   end
  # end

  def show(conn, %{"id" => id}) do
    clothing = Clothings.get_clothing!(id)
    render(conn, "show.html", clothing: clothing)
  end

  def edit(conn, %{"id" => id}) do
    clothing = Clothings.get_clothing!(id)
    changeset = Clothings.change_clothing(clothing)
    render(conn, "edit.html", clothing: clothing, changeset: changeset)
  end

  # def update(conn, %{"id" => id, "clothing" => clothing_params}) do
  #   clothing = Clothings.get_clothing!(id)

  #   case Clothings.update_clothing(clothing, clothing_params) do
  #     {:ok, clothing} ->
  #       conn
  #       |> put_flash(:info, "Clothing updated successfully.")
  #       |> redirect(to: Routes.clothing_path(conn, :show, clothing))

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "edit.html", clothing: clothing, changeset: changeset)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   clothing = Clothings.get_clothing!(id)
  #   {:ok, _clothing} = Clothings.delete_clothing(clothing)

  #   conn
  #   |> put_flash(:info, "Clothing deleted successfully.")
  #   |> redirect(to: Routes.clothing_path(conn, :index))
  # end
end
