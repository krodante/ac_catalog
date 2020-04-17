defmodule AcCatalog.FurnituresTest do
  use AcCatalog.DataCase

  alias AcCatalog.Furnitures

  describe "furnitures" do
    alias AcCatalog.Furnitures.Furniture

    @valid_attrs %{buy_price: 42, category_id: 42, customization_cost: 42, name: "some name", sell_price: 42, size: "some size", source_id: 42, variation: "some variation"}
    @update_attrs %{buy_price: 43, category_id: 43, customization_cost: 43, name: "some updated name", sell_price: 43, size: "some updated size", source_id: 43, variation: "some updated variation"}
    @invalid_attrs %{buy_price: nil, category_id: nil, customization_cost: nil, name: nil, sell_price: nil, size: nil, source_id: nil, variation: nil}

    def furniture_fixture(attrs \\ %{}) do
      {:ok, furniture} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Furnitures.create_furniture()

      furniture
    end

    test "list_furnitures/0 returns all furnitures" do
      furniture = furniture_fixture()
      assert Furnitures.list_furnitures() == [furniture]
    end

    test "get_furniture!/1 returns the furniture with given id" do
      furniture = furniture_fixture()
      assert Furnitures.get_furniture!(furniture.id) == furniture
    end

    test "create_furniture/1 with valid data creates a furniture" do
      assert {:ok, %Furniture{} = furniture} = Furnitures.create_furniture(@valid_attrs)
      assert furniture.buy_price == 42
      assert furniture.category_id == 42
      assert furniture.customization_cost == 42
      assert furniture.name == "some name"
      assert furniture.sell_price == 42
      assert furniture.size == "some size"
      assert furniture.source_id == 42
      assert furniture.variation == "some variation"
    end

    test "create_furniture/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Furnitures.create_furniture(@invalid_attrs)
    end

    test "update_furniture/2 with valid data updates the furniture" do
      furniture = furniture_fixture()
      assert {:ok, %Furniture{} = furniture} = Furnitures.update_furniture(furniture, @update_attrs)
      assert furniture.buy_price == 43
      assert furniture.category_id == 43
      assert furniture.customization_cost == 43
      assert furniture.name == "some updated name"
      assert furniture.sell_price == 43
      assert furniture.size == "some updated size"
      assert furniture.source_id == 43
      assert furniture.variation == "some updated variation"
    end

    test "update_furniture/2 with invalid data returns error changeset" do
      furniture = furniture_fixture()
      assert {:error, %Ecto.Changeset{}} = Furnitures.update_furniture(furniture, @invalid_attrs)
      assert furniture == Furnitures.get_furniture!(furniture.id)
    end

    test "delete_furniture/1 deletes the furniture" do
      furniture = furniture_fixture()
      assert {:ok, %Furniture{}} = Furnitures.delete_furniture(furniture)
      assert_raise Ecto.NoResultsError, fn -> Furnitures.get_furniture!(furniture.id) end
    end

    test "change_furniture/1 returns a furniture changeset" do
      furniture = furniture_fixture()
      assert %Ecto.Changeset{} = Furnitures.change_furniture(furniture)
    end
  end
end
