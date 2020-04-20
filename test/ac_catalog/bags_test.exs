defmodule AcCatalog.BagsTest do
  use AcCatalog.DataCase

  alias AcCatalog.Bags

  describe "bags" do
    alias AcCatalog.Bags.Bag

    @valid_attrs %{buy_price: 42, filename: "some filename", name: "some name", sell_price: 42, source_id: 42, style_id: 42}
    @update_attrs %{buy_price: 43, filename: "some updated filename", name: "some updated name", sell_price: 43, source_id: 43, style_id: 43}
    @invalid_attrs %{buy_price: nil, filename: nil, name: nil, sell_price: nil, source_id: nil, style_id: nil}

    def bag_fixture(attrs \\ %{}) do
      {:ok, bag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bags.create_bag()

      bag
    end

    test "list_bags/0 returns all bags" do
      bag = bag_fixture()
      assert Bags.list_bags() == [bag]
    end

    test "get_bag!/1 returns the bag with given id" do
      bag = bag_fixture()
      assert Bags.get_bag!(bag.id) == bag
    end

    test "create_bag/1 with valid data creates a bag" do
      assert {:ok, %Bag{} = bag} = Bags.create_bag(@valid_attrs)
      assert bag.buy_price == 42
      assert bag.filename == "some filename"
      assert bag.name == "some name"
      assert bag.sell_price == 42
      assert bag.source_id == 42
      assert bag.style_id == 42
    end

    test "create_bag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bags.create_bag(@invalid_attrs)
    end

    test "update_bag/2 with valid data updates the bag" do
      bag = bag_fixture()
      assert {:ok, %Bag{} = bag} = Bags.update_bag(bag, @update_attrs)
      assert bag.buy_price == 43
      assert bag.filename == "some updated filename"
      assert bag.name == "some updated name"
      assert bag.sell_price == 43
      assert bag.source_id == 43
      assert bag.style_id == 43
    end

    test "update_bag/2 with invalid data returns error changeset" do
      bag = bag_fixture()
      assert {:error, %Ecto.Changeset{}} = Bags.update_bag(bag, @invalid_attrs)
      assert bag == Bags.get_bag!(bag.id)
    end

    test "delete_bag/1 deletes the bag" do
      bag = bag_fixture()
      assert {:ok, %Bag{}} = Bags.delete_bag(bag)
      assert_raise Ecto.NoResultsError, fn -> Bags.get_bag!(bag.id) end
    end

    test "change_bag/1 returns a bag changeset" do
      bag = bag_fixture()
      assert %Ecto.Changeset{} = Bags.change_bag(bag)
    end
  end
end
