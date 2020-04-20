defmodule AcCatalog.HeadwearsTest do
  use AcCatalog.DataCase

  alias AcCatalog.Headwears

  describe "headwears" do
    alias AcCatalog.Headwears.Headwear

    @valid_attrs %{buy_price: 42, filename: "some filename", name: "some name", sell_price: 42, source_id: 42, style_id: 42, variation: "some variation"}
    @update_attrs %{buy_price: 43, filename: "some updated filename", name: "some updated name", sell_price: 43, source_id: 43, style_id: 43, variation: "some updated variation"}
    @invalid_attrs %{buy_price: nil, filename: nil, name: nil, sell_price: nil, source_id: nil, style_id: nil, variation: nil}

    def headwear_fixture(attrs \\ %{}) do
      {:ok, headwear} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Headwears.create_headwear()

      headwear
    end

    test "list_headwears/0 returns all headwears" do
      headwear = headwear_fixture()
      assert Headwears.list_headwears() == [headwear]
    end

    test "get_headwear!/1 returns the headwear with given id" do
      headwear = headwear_fixture()
      assert Headwears.get_headwear!(headwear.id) == headwear
    end

    test "create_headwear/1 with valid data creates a headwear" do
      assert {:ok, %Headwear{} = headwear} = Headwears.create_headwear(@valid_attrs)
      assert headwear.buy_price == 42
      assert headwear.filename == "some filename"
      assert headwear.name == "some name"
      assert headwear.sell_price == 42
      assert headwear.source_id == 42
      assert headwear.style_id == 42
      assert headwear.variation == "some variation"
    end

    test "create_headwear/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Headwears.create_headwear(@invalid_attrs)
    end

    test "update_headwear/2 with valid data updates the headwear" do
      headwear = headwear_fixture()
      assert {:ok, %Headwear{} = headwear} = Headwears.update_headwear(headwear, @update_attrs)
      assert headwear.buy_price == 43
      assert headwear.filename == "some updated filename"
      assert headwear.name == "some updated name"
      assert headwear.sell_price == 43
      assert headwear.source_id == 43
      assert headwear.style_id == 43
      assert headwear.variation == "some updated variation"
    end

    test "update_headwear/2 with invalid data returns error changeset" do
      headwear = headwear_fixture()
      assert {:error, %Ecto.Changeset{}} = Headwears.update_headwear(headwear, @invalid_attrs)
      assert headwear == Headwears.get_headwear!(headwear.id)
    end

    test "delete_headwear/1 deletes the headwear" do
      headwear = headwear_fixture()
      assert {:ok, %Headwear{}} = Headwears.delete_headwear(headwear)
      assert_raise Ecto.NoResultsError, fn -> Headwears.get_headwear!(headwear.id) end
    end

    test "change_headwear/1 returns a headwear changeset" do
      headwear = headwear_fixture()
      assert %Ecto.Changeset{} = Headwears.change_headwear(headwear)
    end
  end
end
