defmodule AcCatalog.Furnitures do
  @moduledoc """
  The Furnitures context.
  """

  import Ecto.Query, warn: false
  alias AcCatalog.Repo

  alias AcCatalog.Furnitures.Furniture

  @doc """
  Returns the list of furnitures.

  ## Examples

      iex> list_furnitures()
      [%Furniture{}, ...]

  """
  def list_furnitures do
    Repo.all(Furniture)
  end

  def list_housewares do
    Repo.all(AcCatalog.Housewares.Houseware)
  end

  @doc """
  Gets a single furniture.

  Raises `Ecto.NoResultsError` if the Furniture does not exist.

  ## Examples

      iex> get_furniture!(123)
      %Furniture{}

      iex> get_furniture!(456)
      ** (Ecto.NoResultsError)

  """
  def get_furniture!(id), do: Repo.get!(Furniture, id)

  @doc """
  Creates a furniture.

  ## Examples

      iex> create_furniture(%{field: value})
      {:ok, %Furniture{}}

      iex> create_furniture(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_furniture(attrs \\ %{}) do
    %Furniture{}
    |> Furniture.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a furniture.

  ## Examples

      iex> update_furniture(furniture, %{field: new_value})
      {:ok, %Furniture{}}

      iex> update_furniture(furniture, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_furniture(%Furniture{} = furniture, attrs) do
    furniture
    |> Furniture.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a furniture.

  ## Examples

      iex> delete_furniture(furniture)
      {:ok, %Furniture{}}

      iex> delete_furniture(furniture)
      {:error, %Ecto.Changeset{}}

  """
  def delete_furniture(%Furniture{} = furniture) do
    Repo.delete(furniture)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking furniture changes.

  ## Examples

      iex> change_furniture(furniture)
      %Ecto.Changeset{source: %Furniture{}}

  """
  def change_furniture(%Furniture{} = furniture) do
    Furniture.changeset(furniture, %{})
  end
end
