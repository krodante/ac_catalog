defmodule AcCatalogWeb.FurnitureControllerTest do
  use AcCatalogWeb.ConnCase

  alias AcCatalog.Furnitures

  @create_attrs %{buy_price: 42, category_id: 42, customization_cost: 42, name: "some name", sell_price: 42, size: "some size", source_id: 42, variation: "some variation"}
  @update_attrs %{buy_price: 43, category_id: 43, customization_cost: 43, name: "some updated name", sell_price: 43, size: "some updated size", source_id: 43, variation: "some updated variation"}
  @invalid_attrs %{buy_price: nil, category_id: nil, customization_cost: nil, name: nil, sell_price: nil, size: nil, source_id: nil, variation: nil}

  def fixture(:furniture) do
    {:ok, furniture} = Furnitures.create_furniture(@create_attrs)
    furniture
  end

  describe "index" do
    test "lists all furnitures", %{conn: conn} do
      conn = get(conn, Routes.furniture_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Furnitures"
    end
  end

  describe "new furniture" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.furniture_path(conn, :new))
      assert html_response(conn, 200) =~ "New Furniture"
    end
  end

  describe "create furniture" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.furniture_path(conn, :create), furniture: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.furniture_path(conn, :show, id)

      conn = get(conn, Routes.furniture_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Furniture"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.furniture_path(conn, :create), furniture: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Furniture"
    end
  end

  describe "edit furniture" do
    setup [:create_furniture]

    test "renders form for editing chosen furniture", %{conn: conn, furniture: furniture} do
      conn = get(conn, Routes.furniture_path(conn, :edit, furniture))
      assert html_response(conn, 200) =~ "Edit Furniture"
    end
  end

  describe "update furniture" do
    setup [:create_furniture]

    test "redirects when data is valid", %{conn: conn, furniture: furniture} do
      conn = put(conn, Routes.furniture_path(conn, :update, furniture), furniture: @update_attrs)
      assert redirected_to(conn) == Routes.furniture_path(conn, :show, furniture)

      conn = get(conn, Routes.furniture_path(conn, :show, furniture))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, furniture: furniture} do
      conn = put(conn, Routes.furniture_path(conn, :update, furniture), furniture: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Furniture"
    end
  end

  describe "delete furniture" do
    setup [:create_furniture]

    test "deletes chosen furniture", %{conn: conn, furniture: furniture} do
      conn = delete(conn, Routes.furniture_path(conn, :delete, furniture))
      assert redirected_to(conn) == Routes.furniture_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.furniture_path(conn, :show, furniture))
      end
    end
  end

  defp create_furniture(_) do
    furniture = fixture(:furniture)
    {:ok, furniture: furniture}
  end
end
