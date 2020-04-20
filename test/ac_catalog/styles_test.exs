defmodule AcCatalog.StylesTest do
  use AcCatalog.DataCase

  alias AcCatalog.Styles

  describe "styles" do
    alias AcCatalog.Styles.Style

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def style_fixture(attrs \\ %{}) do
      {:ok, style} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Styles.create_style()

      style
    end

    test "list_styles/0 returns all styles" do
      style = style_fixture()
      assert Styles.list_styles() == [style]
    end

    test "get_style!/1 returns the style with given id" do
      style = style_fixture()
      assert Styles.get_style!(style.id) == style
    end

    test "create_style/1 with valid data creates a style" do
      assert {:ok, %Style{} = style} = Styles.create_style(@valid_attrs)
      assert style.name == "some name"
    end

    test "create_style/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Styles.create_style(@invalid_attrs)
    end

    test "update_style/2 with valid data updates the style" do
      style = style_fixture()
      assert {:ok, %Style{} = style} = Styles.update_style(style, @update_attrs)
      assert style.name == "some updated name"
    end

    test "update_style/2 with invalid data returns error changeset" do
      style = style_fixture()
      assert {:error, %Ecto.Changeset{}} = Styles.update_style(style, @invalid_attrs)
      assert style == Styles.get_style!(style.id)
    end

    test "delete_style/1 deletes the style" do
      style = style_fixture()
      assert {:ok, %Style{}} = Styles.delete_style(style)
      assert_raise Ecto.NoResultsError, fn -> Styles.get_style!(style.id) end
    end

    test "change_style/1 returns a style changeset" do
      style = style_fixture()
      assert %Ecto.Changeset{} = Styles.change_style(style)
    end
  end
end
