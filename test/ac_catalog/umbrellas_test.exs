defmodule AcCatalog.UmbrellasTest do
  use AcCatalog.DataCase

  alias AcCatalog.Umbrellas

  describe "umbrellas" do
    alias AcCatalog.Umbrellas.Umbrella

    @valid_attrs %{buy_price: 42, filename: "some filename", name: "some name", sell_price: 42, source_id: 42}
    @update_attrs %{buy_price: 43, filename: "some updated filename", name: "some updated name", sell_price: 43, source_id: 43}
    @invalid_attrs %{buy_price: nil, filename: nil, name: nil, sell_price: nil, source_id: nil}

    def umbrella_fixture(attrs \\ %{}) do
      {:ok, umbrella} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Umbrellas.create_umbrella()

      umbrella
    end

    test "list_umbrellas/0 returns all umbrellas" do
      umbrella = umbrella_fixture()
      assert Umbrellas.list_umbrellas() == [umbrella]
    end

    test "get_umbrella!/1 returns the umbrella with given id" do
      umbrella = umbrella_fixture()
      assert Umbrellas.get_umbrella!(umbrella.id) == umbrella
    end

    test "create_umbrella/1 with valid data creates a umbrella" do
      assert {:ok, %Umbrella{} = umbrella} = Umbrellas.create_umbrella(@valid_attrs)
      assert umbrella.buy_price == 42
      assert umbrella.filename == "some filename"
      assert umbrella.name == "some name"
      assert umbrella.sell_price == 42
      assert umbrella.source_id == 42
    end

    test "create_umbrella/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Umbrellas.create_umbrella(@invalid_attrs)
    end

    test "update_umbrella/2 with valid data updates the umbrella" do
      umbrella = umbrella_fixture()
      assert {:ok, %Umbrella{} = umbrella} = Umbrellas.update_umbrella(umbrella, @update_attrs)
      assert umbrella.buy_price == 43
      assert umbrella.filename == "some updated filename"
      assert umbrella.name == "some updated name"
      assert umbrella.sell_price == 43
      assert umbrella.source_id == 43
    end

    test "update_umbrella/2 with invalid data returns error changeset" do
      umbrella = umbrella_fixture()
      assert {:error, %Ecto.Changeset{}} = Umbrellas.update_umbrella(umbrella, @invalid_attrs)
      assert umbrella == Umbrellas.get_umbrella!(umbrella.id)
    end

    test "delete_umbrella/1 deletes the umbrella" do
      umbrella = umbrella_fixture()
      assert {:ok, %Umbrella{}} = Umbrellas.delete_umbrella(umbrella)
      assert_raise Ecto.NoResultsError, fn -> Umbrellas.get_umbrella!(umbrella.id) end
    end

    test "change_umbrella/1 returns a umbrella changeset" do
      umbrella = umbrella_fixture()
      assert %Ecto.Changeset{} = Umbrellas.change_umbrella(umbrella)
    end
  end
end
