defmodule AcCatalog.WallMounteds do
  @moduledoc """
  The WallMounteds context.
  """

  import Ecto.Query, warn: false
  alias AcCatalog.Repo

  alias AcCatalog.WallMounteds.WallMounted

  def get_wall_mounteds(ids) do
    from(wm in WallMounted, where: wm.id in ^ids)
    |> Repo.all
  end

  @doc """
  Returns the list of wall_mounteds.

  ## Examples

      iex> list_wall_mounteds()
      [%WallMounted{}, ...]

  """
  def list_wall_mounteds do
    Repo.all(WallMounted)
  end

  @doc """
  Gets a single wall_mounted.

  Raises `Ecto.NoResultsError` if the Wall mounted does not exist.

  ## Examples

      iex> get_wall_mounted!(123)
      %WallMounted{}

      iex> get_wall_mounted!(456)
      ** (Ecto.NoResultsError)

  """
  def get_wall_mounted!(id), do: Repo.get!(WallMounted, id)

  @doc """
  Creates a wall_mounted.

  ## Examples

      iex> create_wall_mounted(%{field: value})
      {:ok, %WallMounted{}}

      iex> create_wall_mounted(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_wall_mounted(attrs \\ %{}) do
    %WallMounted{}
    |> WallMounted.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a wall_mounted.

  ## Examples

      iex> update_wall_mounted(wall_mounted, %{field: new_value})
      {:ok, %WallMounted{}}

      iex> update_wall_mounted(wall_mounted, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_wall_mounted(%WallMounted{} = wall_mounted, attrs) do
    wall_mounted
    |> WallMounted.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a wall_mounted.

  ## Examples

      iex> delete_wall_mounted(wall_mounted)
      {:ok, %WallMounted{}}

      iex> delete_wall_mounted(wall_mounted)
      {:error, %Ecto.Changeset{}}

  """
  def delete_wall_mounted(%WallMounted{} = wall_mounted) do
    Repo.delete(wall_mounted)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking wall_mounted changes.

  ## Examples

      iex> change_wall_mounted(wall_mounted)
      %Ecto.Changeset{source: %WallMounted{}}

  """
  def change_wall_mounted(%WallMounted{} = wall_mounted) do
    WallMounted.changeset(wall_mounted, %{})
  end
end
