defmodule AcCatalog.HousewaresTest do
  use AcCatalog.DataCase

  alias AcCatalog.Housewares

  describe "housewares" do
    alias AcCatalog.Housewares.Houseware

    @valid_attrs %{buy_price: 42, filename: "some filename", name: "some name", sell_price: 42, size: "some size", source_id: 42, variation: "some variation"}
    @update_attrs %{buy_price: 43, filename: "some updated filename", name: "some updated name", sell_price: 43, size: "some updated size", source_id: 43, variation: "some updated variation"}
    @invalid_attrs %{buy_price: nil, filename: nil, name: nil, sell_price: nil, size: nil, source_id: nil, variation: nil}

    def houseware_fixture(attrs \\ %{}) do
      {:ok, houseware} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Housewares.create_houseware()

      houseware
    end

    test "list_housewares/0 returns all housewares" do
      houseware = houseware_fixture()
      assert Housewares.list_housewares() == [houseware]
    end

    test "get_houseware!/1 returns the houseware with given id" do
      houseware = houseware_fixture()
      assert Housewares.get_houseware!(houseware.id) == houseware
    end

    test "create_houseware/1 with valid data creates a houseware" do
      assert {:ok, %Houseware{} = houseware} = Housewares.create_houseware(@valid_attrs)
      assert houseware.buy_price == 42
      assert houseware.filename == "some filename"
      assert houseware.name == "some name"
      assert houseware.sell_price == 42
      assert houseware.size == "some size"
      assert houseware.source_id == 42
      assert houseware.variation == "some variation"
    end

    test "create_houseware/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Housewares.create_houseware(@invalid_attrs)
    end

    test "update_houseware/2 with valid data updates the houseware" do
      houseware = houseware_fixture()
      assert {:ok, %Houseware{} = houseware} = Housewares.update_houseware(houseware, @update_attrs)
      assert houseware.buy_price == 43
      assert houseware.filename == "some updated filename"
      assert houseware.name == "some updated name"
      assert houseware.sell_price == 43
      assert houseware.size == "some updated size"
      assert houseware.source_id == 43
      assert houseware.variation == "some updated variation"
    end

    test "update_houseware/2 with invalid data returns error changeset" do
      houseware = houseware_fixture()
      assert {:error, %Ecto.Changeset{}} = Housewares.update_houseware(houseware, @invalid_attrs)
      assert houseware == Housewares.get_houseware!(houseware.id)
    end

    test "delete_houseware/1 deletes the houseware" do
      houseware = houseware_fixture()
      assert {:ok, %Houseware{}} = Housewares.delete_houseware(houseware)
      assert_raise Ecto.NoResultsError, fn -> Housewares.get_houseware!(houseware.id) end
    end

    test "change_houseware/1 returns a houseware changeset" do
      houseware = houseware_fixture()
      assert %Ecto.Changeset{} = Housewares.change_houseware(houseware)
    end
  end
end
