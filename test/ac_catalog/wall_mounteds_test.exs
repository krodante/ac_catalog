defmodule AcCatalog.WallMountedsTest do
  use AcCatalog.DataCase

  alias AcCatalog.WallMounteds

  describe "wall_mounteds" do
    alias AcCatalog.WallMounteds.WallMounted

    @valid_attrs %{buy_price: 42, filename: "some filename", name: "some name", sell_price: 42, size: "some size", source_id: 42, variation: "some variation"}
    @update_attrs %{buy_price: 43, filename: "some updated filename", name: "some updated name", sell_price: 43, size: "some updated size", source_id: 43, variation: "some updated variation"}
    @invalid_attrs %{buy_price: nil, filename: nil, name: nil, sell_price: nil, size: nil, source_id: nil, variation: nil}

    def wall_mounted_fixture(attrs \\ %{}) do
      {:ok, wall_mounted} =
        attrs
        |> Enum.into(@valid_attrs)
        |> WallMounteds.create_wall_mounted()

      wall_mounted
    end

    test "list_wall_mounteds/0 returns all wall_mounteds" do
      wall_mounted = wall_mounted_fixture()
      assert WallMounteds.list_wall_mounteds() == [wall_mounted]
    end

    test "get_wall_mounted!/1 returns the wall_mounted with given id" do
      wall_mounted = wall_mounted_fixture()
      assert WallMounteds.get_wall_mounted!(wall_mounted.id) == wall_mounted
    end

    test "create_wall_mounted/1 with valid data creates a wall_mounted" do
      assert {:ok, %WallMounted{} = wall_mounted} = WallMounteds.create_wall_mounted(@valid_attrs)
      assert wall_mounted.buy_price == 42
      assert wall_mounted.filename == "some filename"
      assert wall_mounted.name == "some name"
      assert wall_mounted.sell_price == 42
      assert wall_mounted.size == "some size"
      assert wall_mounted.source_id == 42
      assert wall_mounted.variation == "some variation"
    end

    test "create_wall_mounted/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = WallMounteds.create_wall_mounted(@invalid_attrs)
    end

    test "update_wall_mounted/2 with valid data updates the wall_mounted" do
      wall_mounted = wall_mounted_fixture()
      assert {:ok, %WallMounted{} = wall_mounted} = WallMounteds.update_wall_mounted(wall_mounted, @update_attrs)
      assert wall_mounted.buy_price == 43
      assert wall_mounted.filename == "some updated filename"
      assert wall_mounted.name == "some updated name"
      assert wall_mounted.sell_price == 43
      assert wall_mounted.size == "some updated size"
      assert wall_mounted.source_id == 43
      assert wall_mounted.variation == "some updated variation"
    end

    test "update_wall_mounted/2 with invalid data returns error changeset" do
      wall_mounted = wall_mounted_fixture()
      assert {:error, %Ecto.Changeset{}} = WallMounteds.update_wall_mounted(wall_mounted, @invalid_attrs)
      assert wall_mounted == WallMounteds.get_wall_mounted!(wall_mounted.id)
    end

    test "delete_wall_mounted/1 deletes the wall_mounted" do
      wall_mounted = wall_mounted_fixture()
      assert {:ok, %WallMounted{}} = WallMounteds.delete_wall_mounted(wall_mounted)
      assert_raise Ecto.NoResultsError, fn -> WallMounteds.get_wall_mounted!(wall_mounted.id) end
    end

    test "change_wall_mounted/1 returns a wall_mounted changeset" do
      wall_mounted = wall_mounted_fixture()
      assert %Ecto.Changeset{} = WallMounteds.change_wall_mounted(wall_mounted)
    end
  end
end
