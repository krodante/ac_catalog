defmodule AcCatalog.MiscFurnitures do
  @moduledoc """
  The MiscFurnitures context.
  """

  import Ecto.Query, warn: false
  alias AcCatalog.Repo

  alias AcCatalog.MiscFurnitures.MiscFurniture

  def get_misc_furnitures(ids) do
    from(mf in MiscFurniture, where: mf.id in ^ids)
    |> Repo.all
  end

  @doc """
  Returns the list of misc_furniture.

  ## Examples

      iex> list_misc_furniture()
      [%MiscFurniture{}, ...]

  """
  def list_misc_furniture do
    Repo.all(MiscFurniture)
  end

  @doc """
  Gets a single misc_furniture.

  Raises `Ecto.NoResultsError` if the Misc furniture does not exist.

  ## Examples

      iex> get_misc_furniture!(123)
      %MiscFurniture{}

      iex> get_misc_furniture!(456)
      ** (Ecto.NoResultsError)

  """
  def get_misc_furniture!(id), do: Repo.get!(MiscFurniture, id)

  @doc """
  Creates a misc_furniture.

  ## Examples

      iex> create_misc_furniture(%{field: value})
      {:ok, %MiscFurniture{}}

      iex> create_misc_furniture(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_misc_furniture(attrs \\ %{}) do
    %MiscFurniture{}
    |> MiscFurniture.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a misc_furniture.

  ## Examples

      iex> update_misc_furniture(misc_furniture, %{field: new_value})
      {:ok, %MiscFurniture{}}

      iex> update_misc_furniture(misc_furniture, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_misc_furniture(%MiscFurniture{} = misc_furniture, attrs) do
    misc_furniture
    |> MiscFurniture.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a misc_furniture.

  ## Examples

      iex> delete_misc_furniture(misc_furniture)
      {:ok, %MiscFurniture{}}

      iex> delete_misc_furniture(misc_furniture)
      {:error, %Ecto.Changeset{}}

  """
  def delete_misc_furniture(%MiscFurniture{} = misc_furniture) do
    Repo.delete(misc_furniture)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking misc_furniture changes.

  ## Examples

      iex> change_misc_furniture(misc_furniture)
      %Ecto.Changeset{source: %MiscFurniture{}}

  """
  def change_misc_furniture(%MiscFurniture{} = misc_furniture) do
    MiscFurniture.changeset(misc_furniture, %{})
  end
end
