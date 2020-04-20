defmodule AcCatalog.MusicsTest do
  use AcCatalog.DataCase

  alias AcCatalog.Musics

  describe "musics" do
    alias AcCatalog.Musics.Music

    @valid_attrs %{buy_price: 42, filename: "some filename", name: "some name", sell_price: 42, source_id: 42}
    @update_attrs %{buy_price: 43, filename: "some updated filename", name: "some updated name", sell_price: 43, source_id: 43}
    @invalid_attrs %{buy_price: nil, filename: nil, name: nil, sell_price: nil, source_id: nil}

    def music_fixture(attrs \\ %{}) do
      {:ok, music} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Musics.create_music()

      music
    end

    test "list_musics/0 returns all musics" do
      music = music_fixture()
      assert Musics.list_musics() == [music]
    end

    test "get_music!/1 returns the music with given id" do
      music = music_fixture()
      assert Musics.get_music!(music.id) == music
    end

    test "create_music/1 with valid data creates a music" do
      assert {:ok, %Music{} = music} = Musics.create_music(@valid_attrs)
      assert music.buy_price == 42
      assert music.filename == "some filename"
      assert music.name == "some name"
      assert music.sell_price == 42
      assert music.source_id == 42
    end

    test "create_music/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Musics.create_music(@invalid_attrs)
    end

    test "update_music/2 with valid data updates the music" do
      music = music_fixture()
      assert {:ok, %Music{} = music} = Musics.update_music(music, @update_attrs)
      assert music.buy_price == 43
      assert music.filename == "some updated filename"
      assert music.name == "some updated name"
      assert music.sell_price == 43
      assert music.source_id == 43
    end

    test "update_music/2 with invalid data returns error changeset" do
      music = music_fixture()
      assert {:error, %Ecto.Changeset{}} = Musics.update_music(music, @invalid_attrs)
      assert music == Musics.get_music!(music.id)
    end

    test "delete_music/1 deletes the music" do
      music = music_fixture()
      assert {:ok, %Music{}} = Musics.delete_music(music)
      assert_raise Ecto.NoResultsError, fn -> Musics.get_music!(music.id) end
    end

    test "change_music/1 returns a music changeset" do
      music = music_fixture()
      assert %Ecto.Changeset{} = Musics.change_music(music)
    end
  end
end
