defmodule AcCatalog.BottomsTest do
  use AcCatalog.DataCase

  alias AcCatalog.Bottoms

  describe "bottoms" do
    alias AcCatalog.Bottoms.Bottom

    @valid_attrs %{buy_price: 42, filename: "some filename", name: "some name", sell_price: 42, source_id: 42, style_id: 42, variation: "some variation"}
    @update_attrs %{buy_price: 43, filename: "some updated filename", name: "some updated name", sell_price: 43, source_id: 43, style_id: 43, variation: "some updated variation"}
    @invalid_attrs %{buy_price: nil, filename: nil, name: nil, sell_price: nil, source_id: nil, style_id: nil, variation: nil}

    def bottom_fixture(attrs \\ %{}) do
      {:ok, bottom} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bottoms.create_bottom()

      bottom
    end

    test "list_bottoms/0 returns all bottoms" do
      bottom = bottom_fixture()
      assert Bottoms.list_bottoms() == [bottom]
    end

    test "get_bottom!/1 returns the bottom with given id" do
      bottom = bottom_fixture()
      assert Bottoms.get_bottom!(bottom.id) == bottom
    end

    test "create_bottom/1 with valid data creates a bottom" do
      assert {:ok, %Bottom{} = bottom} = Bottoms.create_bottom(@valid_attrs)
      assert bottom.buy_price == 42
      assert bottom.filename == "some filename"
      assert bottom.name == "some name"
      assert bottom.sell_price == 42
      assert bottom.source_id == 42
      assert bottom.style_id == 42
      assert bottom.variation == "some variation"
    end

    test "create_bottom/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bottoms.create_bottom(@invalid_attrs)
    end

    test "update_bottom/2 with valid data updates the bottom" do
      bottom = bottom_fixture()
      assert {:ok, %Bottom{} = bottom} = Bottoms.update_bottom(bottom, @update_attrs)
      assert bottom.buy_price == 43
      assert bottom.filename == "some updated filename"
      assert bottom.name == "some updated name"
      assert bottom.sell_price == 43
      assert bottom.source_id == 43
      assert bottom.style_id == 43
      assert bottom.variation == "some updated variation"
    end

    test "update_bottom/2 with invalid data returns error changeset" do
      bottom = bottom_fixture()
      assert {:error, %Ecto.Changeset{}} = Bottoms.update_bottom(bottom, @invalid_attrs)
      assert bottom == Bottoms.get_bottom!(bottom.id)
    end

    test "delete_bottom/1 deletes the bottom" do
      bottom = bottom_fixture()
      assert {:ok, %Bottom{}} = Bottoms.delete_bottom(bottom)
      assert_raise Ecto.NoResultsError, fn -> Bottoms.get_bottom!(bottom.id) end
    end

    test "change_bottom/1 returns a bottom changeset" do
      bottom = bottom_fixture()
      assert %Ecto.Changeset{} = Bottoms.change_bottom(bottom)
    end
  end
end
