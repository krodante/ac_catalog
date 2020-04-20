defmodule AcCatalog.MiscFurnituresTest do
  use AcCatalog.DataCase

  alias AcCatalog.MiscFurnitures

  describe "misc_furniture" do
    alias AcCatalog.MiscFurnitures.MiscFurniture

    @valid_attrs %{buy_price: 42, filename: "some filename", name: "some name", sell_price: 42, size: "some size", source_id: 42, variation: "some variation"}
    @update_attrs %{buy_price: 43, filename: "some updated filename", name: "some updated name", sell_price: 43, size: "some updated size", source_id: 43, variation: "some updated variation"}
    @invalid_attrs %{buy_price: nil, filename: nil, name: nil, sell_price: nil, size: nil, source_id: nil, variation: nil}

    def misc_furniture_fixture(attrs \\ %{}) do
      {:ok, misc_furniture} =
        attrs
        |> Enum.into(@valid_attrs)
        |> MiscFurnitures.create_misc_furniture()

      misc_furniture
    end

    test "list_misc_furniture/0 returns all misc_furniture" do
      misc_furniture = misc_furniture_fixture()
      assert MiscFurnitures.list_misc_furniture() == [misc_furniture]
    end

    test "get_misc_furniture!/1 returns the misc_furniture with given id" do
      misc_furniture = misc_furniture_fixture()
      assert MiscFurnitures.get_misc_furniture!(misc_furniture.id) == misc_furniture
    end

    test "create_misc_furniture/1 with valid data creates a misc_furniture" do
      assert {:ok, %MiscFurniture{} = misc_furniture} = MiscFurnitures.create_misc_furniture(@valid_attrs)
      assert misc_furniture.buy_price == 42
      assert misc_furniture.filename == "some filename"
      assert misc_furniture.name == "some name"
      assert misc_furniture.sell_price == 42
      assert misc_furniture.size == "some size"
      assert misc_furniture.source_id == 42
      assert misc_furniture.variation == "some variation"
    end

    test "create_misc_furniture/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MiscFurnitures.create_misc_furniture(@invalid_attrs)
    end

    test "update_misc_furniture/2 with valid data updates the misc_furniture" do
      misc_furniture = misc_furniture_fixture()
      assert {:ok, %MiscFurniture{} = misc_furniture} = MiscFurnitures.update_misc_furniture(misc_furniture, @update_attrs)
      assert misc_furniture.buy_price == 43
      assert misc_furniture.filename == "some updated filename"
      assert misc_furniture.name == "some updated name"
      assert misc_furniture.sell_price == 43
      assert misc_furniture.size == "some updated size"
      assert misc_furniture.source_id == 43
      assert misc_furniture.variation == "some updated variation"
    end

    test "update_misc_furniture/2 with invalid data returns error changeset" do
      misc_furniture = misc_furniture_fixture()
      assert {:error, %Ecto.Changeset{}} = MiscFurnitures.update_misc_furniture(misc_furniture, @invalid_attrs)
      assert misc_furniture == MiscFurnitures.get_misc_furniture!(misc_furniture.id)
    end

    test "delete_misc_furniture/1 deletes the misc_furniture" do
      misc_furniture = misc_furniture_fixture()
      assert {:ok, %MiscFurniture{}} = MiscFurnitures.delete_misc_furniture(misc_furniture)
      assert_raise Ecto.NoResultsError, fn -> MiscFurnitures.get_misc_furniture!(misc_furniture.id) end
    end

    test "change_misc_furniture/1 returns a misc_furniture changeset" do
      misc_furniture = misc_furniture_fixture()
      assert %Ecto.Changeset{} = MiscFurnitures.change_misc_furniture(misc_furniture)
    end
  end
end
