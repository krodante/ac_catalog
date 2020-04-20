defmodule AcCatalog.ClothingsTest do
  use AcCatalog.DataCase

  alias AcCatalog.Clothings

  describe "clothings" do
    alias AcCatalog.Clothings.Clothing

    @valid_attrs %{buy_price: 42, filename: "some filename", name: "some name", sell_price: 42, source_id: 42, style_id: 42, variation: "some variation"}
    @update_attrs %{buy_price: 43, filename: "some updated filename", name: "some updated name", sell_price: 43, source_id: 43, style_id: 43, variation: "some updated variation"}
    @invalid_attrs %{buy_price: nil, filename: nil, name: nil, sell_price: nil, source_id: nil, style_id: nil, variation: nil}

    def clothing_fixture(attrs \\ %{}) do
      {:ok, clothing} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Clothings.create_clothing()

      clothing
    end

    test "list_clothings/0 returns all clothings" do
      clothing = clothing_fixture()
      assert Clothings.list_clothings() == [clothing]
    end

    test "get_clothing!/1 returns the clothing with given id" do
      clothing = clothing_fixture()
      assert Clothings.get_clothing!(clothing.id) == clothing
    end

    test "create_clothing/1 with valid data creates a clothing" do
      assert {:ok, %Clothing{} = clothing} = Clothings.create_clothing(@valid_attrs)
      assert clothing.buy_price == 42
      assert clothing.filename == "some filename"
      assert clothing.name == "some name"
      assert clothing.sell_price == 42
      assert clothing.source_id == 42
      assert clothing.style_id == 42
      assert clothing.variation == "some variation"
    end

    test "create_clothing/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clothings.create_clothing(@invalid_attrs)
    end

    test "update_clothing/2 with valid data updates the clothing" do
      clothing = clothing_fixture()
      assert {:ok, %Clothing{} = clothing} = Clothings.update_clothing(clothing, @update_attrs)
      assert clothing.buy_price == 43
      assert clothing.filename == "some updated filename"
      assert clothing.name == "some updated name"
      assert clothing.sell_price == 43
      assert clothing.source_id == 43
      assert clothing.style_id == 43
      assert clothing.variation == "some updated variation"
    end

    test "update_clothing/2 with invalid data returns error changeset" do
      clothing = clothing_fixture()
      assert {:error, %Ecto.Changeset{}} = Clothings.update_clothing(clothing, @invalid_attrs)
      assert clothing == Clothings.get_clothing!(clothing.id)
    end

    test "delete_clothing/1 deletes the clothing" do
      clothing = clothing_fixture()
      assert {:ok, %Clothing{}} = Clothings.delete_clothing(clothing)
      assert_raise Ecto.NoResultsError, fn -> Clothings.get_clothing!(clothing.id) end
    end

    test "change_clothing/1 returns a clothing changeset" do
      clothing = clothing_fixture()
      assert %Ecto.Changeset{} = Clothings.change_clothing(clothing)
    end
  end
end
