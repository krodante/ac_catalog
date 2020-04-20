defmodule AcCatalog.AccessoriesTest do
  use AcCatalog.DataCase

  alias AcCatalog.Accessories

  describe "accessories" do
    alias AcCatalog.Accessories.Accessory

    @valid_attrs %{buy_price: 42, filename: "some filename", name: "some name", sell_price: 42, source_id: 42, style_id: 42, variation: "some variation"}
    @update_attrs %{buy_price: 43, filename: "some updated filename", name: "some updated name", sell_price: 43, source_id: 43, style_id: 43, variation: "some updated variation"}
    @invalid_attrs %{buy_price: nil, filename: nil, name: nil, sell_price: nil, source_id: nil, style_id: nil, variation: nil}

    def accessory_fixture(attrs \\ %{}) do
      {:ok, accessory} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accessories.create_accessory()

      accessory
    end

    test "list_accessories/0 returns all accessories" do
      accessory = accessory_fixture()
      assert Accessories.list_accessories() == [accessory]
    end

    test "get_accessory!/1 returns the accessory with given id" do
      accessory = accessory_fixture()
      assert Accessories.get_accessory!(accessory.id) == accessory
    end

    test "create_accessory/1 with valid data creates a accessory" do
      assert {:ok, %Accessory{} = accessory} = Accessories.create_accessory(@valid_attrs)
      assert accessory.buy_price == 42
      assert accessory.filename == "some filename"
      assert accessory.name == "some name"
      assert accessory.sell_price == 42
      assert accessory.source_id == 42
      assert accessory.style_id == 42
      assert accessory.variation == "some variation"
    end

    test "create_accessory/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accessories.create_accessory(@invalid_attrs)
    end

    test "update_accessory/2 with valid data updates the accessory" do
      accessory = accessory_fixture()
      assert {:ok, %Accessory{} = accessory} = Accessories.update_accessory(accessory, @update_attrs)
      assert accessory.buy_price == 43
      assert accessory.filename == "some updated filename"
      assert accessory.name == "some updated name"
      assert accessory.sell_price == 43
      assert accessory.source_id == 43
      assert accessory.style_id == 43
      assert accessory.variation == "some updated variation"
    end

    test "update_accessory/2 with invalid data returns error changeset" do
      accessory = accessory_fixture()
      assert {:error, %Ecto.Changeset{}} = Accessories.update_accessory(accessory, @invalid_attrs)
      assert accessory == Accessories.get_accessory!(accessory.id)
    end

    test "delete_accessory/1 deletes the accessory" do
      accessory = accessory_fixture()
      assert {:ok, %Accessory{}} = Accessories.delete_accessory(accessory)
      assert_raise Ecto.NoResultsError, fn -> Accessories.get_accessory!(accessory.id) end
    end

    test "change_accessory/1 returns a accessory changeset" do
      accessory = accessory_fixture()
      assert %Ecto.Changeset{} = Accessories.change_accessory(accessory)
    end
  end
end
