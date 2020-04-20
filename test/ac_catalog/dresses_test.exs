defmodule AcCatalog.DressesTest do
  use AcCatalog.DataCase

  alias AcCatalog.Dresses

  describe "dresses" do
    alias AcCatalog.Dresses.Dress

    @valid_attrs %{buy_price: 42, filename: "some filename", name: "some name", sell_price: 42, source_id: 42, style_id: 42, variation: "some variation"}
    @update_attrs %{buy_price: 43, filename: "some updated filename", name: "some updated name", sell_price: 43, source_id: 43, style_id: 43, variation: "some updated variation"}
    @invalid_attrs %{buy_price: nil, filename: nil, name: nil, sell_price: nil, source_id: nil, style_id: nil, variation: nil}

    def dress_fixture(attrs \\ %{}) do
      {:ok, dress} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Dresses.create_dress()

      dress
    end

    test "list_dresses/0 returns all dresses" do
      dress = dress_fixture()
      assert Dresses.list_dresses() == [dress]
    end

    test "get_dress!/1 returns the dress with given id" do
      dress = dress_fixture()
      assert Dresses.get_dress!(dress.id) == dress
    end

    test "create_dress/1 with valid data creates a dress" do
      assert {:ok, %Dress{} = dress} = Dresses.create_dress(@valid_attrs)
      assert dress.buy_price == 42
      assert dress.filename == "some filename"
      assert dress.name == "some name"
      assert dress.sell_price == 42
      assert dress.source_id == 42
      assert dress.style_id == 42
      assert dress.variation == "some variation"
    end

    test "create_dress/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dresses.create_dress(@invalid_attrs)
    end

    test "update_dress/2 with valid data updates the dress" do
      dress = dress_fixture()
      assert {:ok, %Dress{} = dress} = Dresses.update_dress(dress, @update_attrs)
      assert dress.buy_price == 43
      assert dress.filename == "some updated filename"
      assert dress.name == "some updated name"
      assert dress.sell_price == 43
      assert dress.source_id == 43
      assert dress.style_id == 43
      assert dress.variation == "some updated variation"
    end

    test "update_dress/2 with invalid data returns error changeset" do
      dress = dress_fixture()
      assert {:error, %Ecto.Changeset{}} = Dresses.update_dress(dress, @invalid_attrs)
      assert dress == Dresses.get_dress!(dress.id)
    end

    test "delete_dress/1 deletes the dress" do
      dress = dress_fixture()
      assert {:ok, %Dress{}} = Dresses.delete_dress(dress)
      assert_raise Ecto.NoResultsError, fn -> Dresses.get_dress!(dress.id) end
    end

    test "change_dress/1 returns a dress changeset" do
      dress = dress_fixture()
      assert %Ecto.Changeset{} = Dresses.change_dress(dress)
    end
  end
end
