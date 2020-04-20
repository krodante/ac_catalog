defmodule AcCatalog.FloorsTest do
  use AcCatalog.DataCase

  alias AcCatalog.Floors

  describe "floors" do
    alias AcCatalog.Floors.Floor

    @valid_attrs %{buy_price: 42, filename: "some filename", name: "some name", sell_price: 42, source_id: 42}
    @update_attrs %{buy_price: 43, filename: "some updated filename", name: "some updated name", sell_price: 43, source_id: 43}
    @invalid_attrs %{buy_price: nil, filename: nil, name: nil, sell_price: nil, source_id: nil}

    def floor_fixture(attrs \\ %{}) do
      {:ok, floor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Floors.create_floor()

      floor
    end

    test "list_floors/0 returns all floors" do
      floor = floor_fixture()
      assert Floors.list_floors() == [floor]
    end

    test "get_floor!/1 returns the floor with given id" do
      floor = floor_fixture()
      assert Floors.get_floor!(floor.id) == floor
    end

    test "create_floor/1 with valid data creates a floor" do
      assert {:ok, %Floor{} = floor} = Floors.create_floor(@valid_attrs)
      assert floor.buy_price == 42
      assert floor.filename == "some filename"
      assert floor.name == "some name"
      assert floor.sell_price == 42
      assert floor.source_id == 42
    end

    test "create_floor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Floors.create_floor(@invalid_attrs)
    end

    test "update_floor/2 with valid data updates the floor" do
      floor = floor_fixture()
      assert {:ok, %Floor{} = floor} = Floors.update_floor(floor, @update_attrs)
      assert floor.buy_price == 43
      assert floor.filename == "some updated filename"
      assert floor.name == "some updated name"
      assert floor.sell_price == 43
      assert floor.source_id == 43
    end

    test "update_floor/2 with invalid data returns error changeset" do
      floor = floor_fixture()
      assert {:error, %Ecto.Changeset{}} = Floors.update_floor(floor, @invalid_attrs)
      assert floor == Floors.get_floor!(floor.id)
    end

    test "delete_floor/1 deletes the floor" do
      floor = floor_fixture()
      assert {:ok, %Floor{}} = Floors.delete_floor(floor)
      assert_raise Ecto.NoResultsError, fn -> Floors.get_floor!(floor.id) end
    end

    test "change_floor/1 returns a floor changeset" do
      floor = floor_fixture()
      assert %Ecto.Changeset{} = Floors.change_floor(floor)
    end
  end
end
