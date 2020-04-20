defmodule AcCatalog.Umbrellas do
  @moduledoc """
  The Umbrellas context.
  """

  import Ecto.Query, warn: false
  alias AcCatalog.Repo

  alias AcCatalog.Umbrellas.Umbrella

  @doc """
  Returns the list of umbrellas.

  ## Examples

      iex> list_umbrellas()
      [%Umbrella{}, ...]

  """
  def list_umbrellas do
    Repo.all(Umbrella)
  end

  @doc """
  Gets a single umbrella.

  Raises `Ecto.NoResultsError` if the Umbrella does not exist.

  ## Examples

      iex> get_umbrella!(123)
      %Umbrella{}

      iex> get_umbrella!(456)
      ** (Ecto.NoResultsError)

  """
  def get_umbrella!(id), do: Repo.get!(Umbrella, id)

  @doc """
  Creates a umbrella.

  ## Examples

      iex> create_umbrella(%{field: value})
      {:ok, %Umbrella{}}

      iex> create_umbrella(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_umbrella(attrs \\ %{}) do
    %Umbrella{}
    |> Umbrella.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a umbrella.

  ## Examples

      iex> update_umbrella(umbrella, %{field: new_value})
      {:ok, %Umbrella{}}

      iex> update_umbrella(umbrella, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_umbrella(%Umbrella{} = umbrella, attrs) do
    umbrella
    |> Umbrella.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a umbrella.

  ## Examples

      iex> delete_umbrella(umbrella)
      {:ok, %Umbrella{}}

      iex> delete_umbrella(umbrella)
      {:error, %Ecto.Changeset{}}

  """
  def delete_umbrella(%Umbrella{} = umbrella) do
    Repo.delete(umbrella)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking umbrella changes.

  ## Examples

      iex> change_umbrella(umbrella)
      %Ecto.Changeset{source: %Umbrella{}}

  """
  def change_umbrella(%Umbrella{} = umbrella) do
    Umbrella.changeset(umbrella, %{})
  end
end
