defmodule AcCatalog.Wallpapers do
  @moduledoc """
  The Wallpapers context.
  """

  import Ecto.Query, warn: false
  alias AcCatalog.Repo

  alias AcCatalog.Wallpapers.Wallpaper

  def get_wallpapers(ids) do
    from(w in Wallpaper, where: w.id in ^ids)
    |> Repo.all
  end

  @doc """
  Returns the list of wallpapers.

  ## Examples

      iex> list_wallpapers()
      [%Wallpaper{}, ...]

  """
  def list_wallpapers do
    Repo.all(Wallpaper)
  end

  @doc """
  Gets a single wallpaper.

  Raises `Ecto.NoResultsError` if the Wallpaper does not exist.

  ## Examples

      iex> get_wallpaper!(123)
      %Wallpaper{}

      iex> get_wallpaper!(456)
      ** (Ecto.NoResultsError)

  """
  def get_wallpaper!(id), do: Repo.get!(Wallpaper, id)

  @doc """
  Creates a wallpaper.

  ## Examples

      iex> create_wallpaper(%{field: value})
      {:ok, %Wallpaper{}}

      iex> create_wallpaper(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_wallpaper(attrs \\ %{}) do
    %Wallpaper{}
    |> Wallpaper.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a wallpaper.

  ## Examples

      iex> update_wallpaper(wallpaper, %{field: new_value})
      {:ok, %Wallpaper{}}

      iex> update_wallpaper(wallpaper, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_wallpaper(%Wallpaper{} = wallpaper, attrs) do
    wallpaper
    |> Wallpaper.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a wallpaper.

  ## Examples

      iex> delete_wallpaper(wallpaper)
      {:ok, %Wallpaper{}}

      iex> delete_wallpaper(wallpaper)
      {:error, %Ecto.Changeset{}}

  """
  def delete_wallpaper(%Wallpaper{} = wallpaper) do
    Repo.delete(wallpaper)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking wallpaper changes.

  ## Examples

      iex> change_wallpaper(wallpaper)
      %Ecto.Changeset{source: %Wallpaper{}}

  """
  def change_wallpaper(%Wallpaper{} = wallpaper) do
    Wallpaper.changeset(wallpaper, %{})
  end
end
