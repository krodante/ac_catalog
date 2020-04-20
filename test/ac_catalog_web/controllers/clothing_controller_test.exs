defmodule AcCatalogWeb.ClothingControllerTest do
  use AcCatalogWeb.ConnCase

  alias AcCatalog.Clothings

  @create_attrs %{buy_price: 42, filename: "some filename", name: "some name", sell_price: 42, source_id: 42, style_id: 42, variation: "some variation"}
  @update_attrs %{buy_price: 43, filename: "some updated filename", name: "some updated name", sell_price: 43, source_id: 43, style_id: 43, variation: "some updated variation"}
  @invalid_attrs %{buy_price: nil, filename: nil, name: nil, sell_price: nil, source_id: nil, style_id: nil, variation: nil}

  def fixture(:clothing) do
    {:ok, clothing} = Clothings.create_clothing(@create_attrs)
    clothing
  end

  describe "index" do
    test "lists all clothings", %{conn: conn} do
      conn = get(conn, Routes.clothing_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Clothings"
    end
  end

  describe "new clothing" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.clothing_path(conn, :new))
      assert html_response(conn, 200) =~ "New Clothing"
    end
  end

  describe "create clothing" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.clothing_path(conn, :create), clothing: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.clothing_path(conn, :show, id)

      conn = get(conn, Routes.clothing_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Clothing"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.clothing_path(conn, :create), clothing: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Clothing"
    end
  end

  describe "edit clothing" do
    setup [:create_clothing]

    test "renders form for editing chosen clothing", %{conn: conn, clothing: clothing} do
      conn = get(conn, Routes.clothing_path(conn, :edit, clothing))
      assert html_response(conn, 200) =~ "Edit Clothing"
    end
  end

  describe "update clothing" do
    setup [:create_clothing]

    test "redirects when data is valid", %{conn: conn, clothing: clothing} do
      conn = put(conn, Routes.clothing_path(conn, :update, clothing), clothing: @update_attrs)
      assert redirected_to(conn) == Routes.clothing_path(conn, :show, clothing)

      conn = get(conn, Routes.clothing_path(conn, :show, clothing))
      assert html_response(conn, 200) =~ "some updated filename"
    end

    test "renders errors when data is invalid", %{conn: conn, clothing: clothing} do
      conn = put(conn, Routes.clothing_path(conn, :update, clothing), clothing: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Clothing"
    end
  end

  describe "delete clothing" do
    setup [:create_clothing]

    test "deletes chosen clothing", %{conn: conn, clothing: clothing} do
      conn = delete(conn, Routes.clothing_path(conn, :delete, clothing))
      assert redirected_to(conn) == Routes.clothing_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.clothing_path(conn, :show, clothing))
      end
    end
  end

  defp create_clothing(_) do
    clothing = fixture(:clothing)
    {:ok, clothing: clothing}
  end
end
