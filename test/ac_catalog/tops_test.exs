defmodule AcCatalog.TopsTest do
  use AcCatalog.DataCase

  alias AcCatalog.Tops

  describe "tops" do
    alias AcCatalog.Tops.Top

    @valid_attrs %{buy_price: 42, filename: "some filename", name: "some name", sell_price: 42, source_id: 42, style_id: 42, variation: "some variation"}
    @update_attrs %{buy_price: 43, filename: "some updated filename", name: "some updated name", sell_price: 43, source_id: 43, style_id: 43, variation: "some updated variation"}
    @invalid_attrs %{buy_price: nil, filename: nil, name: nil, sell_price: nil, source_id: nil, style_id: nil, variation: nil}

    def top_fixture(attrs \\ %{}) do
      {:ok, top} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tops.create_top()

      top
    end

    test "list_tops/0 returns all tops" do
      top = top_fixture()
      assert Tops.list_tops() == [top]
    end

    test "get_top!/1 returns the top with given id" do
      top = top_fixture()
      assert Tops.get_top!(top.id) == top
    end

    test "create_top/1 with valid data creates a top" do
      assert {:ok, %Top{} = top} = Tops.create_top(@valid_attrs)
      assert top.buy_price == 42
      assert top.filename == "some filename"
      assert top.name == "some name"
      assert top.sell_price == 42
      assert top.source_id == 42
      assert top.style_id == 42
      assert top.variation == "some variation"
    end

    test "create_top/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tops.create_top(@invalid_attrs)
    end

    test "update_top/2 with valid data updates the top" do
      top = top_fixture()
      assert {:ok, %Top{} = top} = Tops.update_top(top, @update_attrs)
      assert top.buy_price == 43
      assert top.filename == "some updated filename"
      assert top.name == "some updated name"
      assert top.sell_price == 43
      assert top.source_id == 43
      assert top.style_id == 43
      assert top.variation == "some updated variation"
    end

    test "update_top/2 with invalid data returns error changeset" do
      top = top_fixture()
      assert {:error, %Ecto.Changeset{}} = Tops.update_top(top, @invalid_attrs)
      assert top == Tops.get_top!(top.id)
    end

    test "delete_top/1 deletes the top" do
      top = top_fixture()
      assert {:ok, %Top{}} = Tops.delete_top(top)
      assert_raise Ecto.NoResultsError, fn -> Tops.get_top!(top.id) end
    end

    test "change_top/1 returns a top changeset" do
      top = top_fixture()
      assert %Ecto.Changeset{} = Tops.change_top(top)
    end
  end
end
