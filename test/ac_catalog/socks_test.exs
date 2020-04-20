defmodule AcCatalog.SocksTest do
  use AcCatalog.DataCase

  alias AcCatalog.Socks

  describe "socks" do
    alias AcCatalog.Socks.Sock

    @valid_attrs %{buy_price: 42, filename: "some filename", name: "some name", sell_price: 42, source_id: 42, style_id: 42, variation: "some variation"}
    @update_attrs %{buy_price: 43, filename: "some updated filename", name: "some updated name", sell_price: 43, source_id: 43, style_id: 43, variation: "some updated variation"}
    @invalid_attrs %{buy_price: nil, filename: nil, name: nil, sell_price: nil, source_id: nil, style_id: nil, variation: nil}

    def sock_fixture(attrs \\ %{}) do
      {:ok, sock} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Socks.create_sock()

      sock
    end

    test "list_socks/0 returns all socks" do
      sock = sock_fixture()
      assert Socks.list_socks() == [sock]
    end

    test "get_sock!/1 returns the sock with given id" do
      sock = sock_fixture()
      assert Socks.get_sock!(sock.id) == sock
    end

    test "create_sock/1 with valid data creates a sock" do
      assert {:ok, %Sock{} = sock} = Socks.create_sock(@valid_attrs)
      assert sock.buy_price == 42
      assert sock.filename == "some filename"
      assert sock.name == "some name"
      assert sock.sell_price == 42
      assert sock.source_id == 42
      assert sock.style_id == 42
      assert sock.variation == "some variation"
    end

    test "create_sock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Socks.create_sock(@invalid_attrs)
    end

    test "update_sock/2 with valid data updates the sock" do
      sock = sock_fixture()
      assert {:ok, %Sock{} = sock} = Socks.update_sock(sock, @update_attrs)
      assert sock.buy_price == 43
      assert sock.filename == "some updated filename"
      assert sock.name == "some updated name"
      assert sock.sell_price == 43
      assert sock.source_id == 43
      assert sock.style_id == 43
      assert sock.variation == "some updated variation"
    end

    test "update_sock/2 with invalid data returns error changeset" do
      sock = sock_fixture()
      assert {:error, %Ecto.Changeset{}} = Socks.update_sock(sock, @invalid_attrs)
      assert sock == Socks.get_sock!(sock.id)
    end

    test "delete_sock/1 deletes the sock" do
      sock = sock_fixture()
      assert {:ok, %Sock{}} = Socks.delete_sock(sock)
      assert_raise Ecto.NoResultsError, fn -> Socks.get_sock!(sock.id) end
    end

    test "change_sock/1 returns a sock changeset" do
      sock = sock_fixture()
      assert %Ecto.Changeset{} = Socks.change_sock(sock)
    end
  end
end
