defmodule AcCatalog.RugsTest do
  use AcCatalog.DataCase

  alias AcCatalog.Rugs

  describe "rugs" do
    alias AcCatalog.Rugs.Rug

    @valid_attrs %{buy_price: 42, filename: "some filename", name: "some name", sell_price: 42, size: "some size", source_id: 42}
    @update_attrs %{buy_price: 43, filename: "some updated filename", name: "some updated name", sell_price: 43, size: "some updated size", source_id: 43}
    @invalid_attrs %{buy_price: nil, filename: nil, name: nil, sell_price: nil, size: nil, source_id: nil}

    def rug_fixture(attrs \\ %{}) do
      {:ok, rug} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Rugs.create_rug()

      rug
    end

    test "list_rugs/0 returns all rugs" do
      rug = rug_fixture()
      assert Rugs.list_rugs() == [rug]
    end

    test "get_rug!/1 returns the rug with given id" do
      rug = rug_fixture()
      assert Rugs.get_rug!(rug.id) == rug
    end

    test "create_rug/1 with valid data creates a rug" do
      assert {:ok, %Rug{} = rug} = Rugs.create_rug(@valid_attrs)
      assert rug.buy_price == 42
      assert rug.filename == "some filename"
      assert rug.name == "some name"
      assert rug.sell_price == 42
      assert rug.size == "some size"
      assert rug.source_id == 42
    end

    test "create_rug/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Rugs.create_rug(@invalid_attrs)
    end

    test "update_rug/2 with valid data updates the rug" do
      rug = rug_fixture()
      assert {:ok, %Rug{} = rug} = Rugs.update_rug(rug, @update_attrs)
      assert rug.buy_price == 43
      assert rug.filename == "some updated filename"
      assert rug.name == "some updated name"
      assert rug.sell_price == 43
      assert rug.size == "some updated size"
      assert rug.source_id == 43
    end

    test "update_rug/2 with invalid data returns error changeset" do
      rug = rug_fixture()
      assert {:error, %Ecto.Changeset{}} = Rugs.update_rug(rug, @invalid_attrs)
      assert rug == Rugs.get_rug!(rug.id)
    end

    test "delete_rug/1 deletes the rug" do
      rug = rug_fixture()
      assert {:ok, %Rug{}} = Rugs.delete_rug(rug)
      assert_raise Ecto.NoResultsError, fn -> Rugs.get_rug!(rug.id) end
    end

    test "change_rug/1 returns a rug changeset" do
      rug = rug_fixture()
      assert %Ecto.Changeset{} = Rugs.change_rug(rug)
    end
  end
end
