defmodule AcCatalog.ShoesTest do
  use AcCatalog.DataCase

  alias AcCatalog.Shoes

  describe "shoes" do
    alias AcCatalog.Shoes.Shoe

    @valid_attrs %{buy_price: 42, filename: "some filename", name: "some name", sell_price: 42, source_id: 42, style_id: 42, variation: "some variation"}
    @update_attrs %{buy_price: 43, filename: "some updated filename", name: "some updated name", sell_price: 43, source_id: 43, style_id: 43, variation: "some updated variation"}
    @invalid_attrs %{buy_price: nil, filename: nil, name: nil, sell_price: nil, source_id: nil, style_id: nil, variation: nil}

    def shoe_fixture(attrs \\ %{}) do
      {:ok, shoe} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shoes.create_shoe()

      shoe
    end

    test "list_shoes/0 returns all shoes" do
      shoe = shoe_fixture()
      assert Shoes.list_shoes() == [shoe]
    end

    test "get_shoe!/1 returns the shoe with given id" do
      shoe = shoe_fixture()
      assert Shoes.get_shoe!(shoe.id) == shoe
    end

    test "create_shoe/1 with valid data creates a shoe" do
      assert {:ok, %Shoe{} = shoe} = Shoes.create_shoe(@valid_attrs)
      assert shoe.buy_price == 42
      assert shoe.filename == "some filename"
      assert shoe.name == "some name"
      assert shoe.sell_price == 42
      assert shoe.source_id == 42
      assert shoe.style_id == 42
      assert shoe.variation == "some variation"
    end

    test "create_shoe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shoes.create_shoe(@invalid_attrs)
    end

    test "update_shoe/2 with valid data updates the shoe" do
      shoe = shoe_fixture()
      assert {:ok, %Shoe{} = shoe} = Shoes.update_shoe(shoe, @update_attrs)
      assert shoe.buy_price == 43
      assert shoe.filename == "some updated filename"
      assert shoe.name == "some updated name"
      assert shoe.sell_price == 43
      assert shoe.source_id == 43
      assert shoe.style_id == 43
      assert shoe.variation == "some updated variation"
    end

    test "update_shoe/2 with invalid data returns error changeset" do
      shoe = shoe_fixture()
      assert {:error, %Ecto.Changeset{}} = Shoes.update_shoe(shoe, @invalid_attrs)
      assert shoe == Shoes.get_shoe!(shoe.id)
    end

    test "delete_shoe/1 deletes the shoe" do
      shoe = shoe_fixture()
      assert {:ok, %Shoe{}} = Shoes.delete_shoe(shoe)
      assert_raise Ecto.NoResultsError, fn -> Shoes.get_shoe!(shoe.id) end
    end

    test "change_shoe/1 returns a shoe changeset" do
      shoe = shoe_fixture()
      assert %Ecto.Changeset{} = Shoes.change_shoe(shoe)
    end
  end
end
