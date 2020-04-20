defmodule AcCatalog.WallpapersTest do
  use AcCatalog.DataCase

  alias AcCatalog.Wallpapers

  describe "wallpapers" do
    alias AcCatalog.Wallpapers.Wallpaper

    @valid_attrs %{buy_price: 42, filename: "some filename", name: "some name", sell_price: 42, source_id: 42}
    @update_attrs %{buy_price: 43, filename: "some updated filename", name: "some updated name", sell_price: 43, source_id: 43}
    @invalid_attrs %{buy_price: nil, filename: nil, name: nil, sell_price: nil, source_id: nil}

    def wallpaper_fixture(attrs \\ %{}) do
      {:ok, wallpaper} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Wallpapers.create_wallpaper()

      wallpaper
    end

    test "list_wallpapers/0 returns all wallpapers" do
      wallpaper = wallpaper_fixture()
      assert Wallpapers.list_wallpapers() == [wallpaper]
    end

    test "get_wallpaper!/1 returns the wallpaper with given id" do
      wallpaper = wallpaper_fixture()
      assert Wallpapers.get_wallpaper!(wallpaper.id) == wallpaper
    end

    test "create_wallpaper/1 with valid data creates a wallpaper" do
      assert {:ok, %Wallpaper{} = wallpaper} = Wallpapers.create_wallpaper(@valid_attrs)
      assert wallpaper.buy_price == 42
      assert wallpaper.filename == "some filename"
      assert wallpaper.name == "some name"
      assert wallpaper.sell_price == 42
      assert wallpaper.source_id == 42
    end

    test "create_wallpaper/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Wallpapers.create_wallpaper(@invalid_attrs)
    end

    test "update_wallpaper/2 with valid data updates the wallpaper" do
      wallpaper = wallpaper_fixture()
      assert {:ok, %Wallpaper{} = wallpaper} = Wallpapers.update_wallpaper(wallpaper, @update_attrs)
      assert wallpaper.buy_price == 43
      assert wallpaper.filename == "some updated filename"
      assert wallpaper.name == "some updated name"
      assert wallpaper.sell_price == 43
      assert wallpaper.source_id == 43
    end

    test "update_wallpaper/2 with invalid data returns error changeset" do
      wallpaper = wallpaper_fixture()
      assert {:error, %Ecto.Changeset{}} = Wallpapers.update_wallpaper(wallpaper, @invalid_attrs)
      assert wallpaper == Wallpapers.get_wallpaper!(wallpaper.id)
    end

    test "delete_wallpaper/1 deletes the wallpaper" do
      wallpaper = wallpaper_fixture()
      assert {:ok, %Wallpaper{}} = Wallpapers.delete_wallpaper(wallpaper)
      assert_raise Ecto.NoResultsError, fn -> Wallpapers.get_wallpaper!(wallpaper.id) end
    end

    test "change_wallpaper/1 returns a wallpaper changeset" do
      wallpaper = wallpaper_fixture()
      assert %Ecto.Changeset{} = Wallpapers.change_wallpaper(wallpaper)
    end
  end
end
