defmodule AcCatalog.Dresses do
  @moduledoc """
  The Dresses context.
  """

  import Ecto.Query, warn: false
  alias AcCatalog.Repo

  alias AcCatalog.Dresses.Dress

  def get_dresses(ids) do
    from(d in Dress, where: d.id in ^ids)
    |> Repo.all
  end

  @doc """
  Returns the list of dresses.

  ## Examples

      iex> list_dresses()
      [%Dress{}, ...]

  """
  def list_dresses do
    Repo.all(Dress)
  end

  @doc """
  Gets a single dress.

  Raises `Ecto.NoResultsError` if the Dress does not exist.

  ## Examples

      iex> get_dress!(123)
      %Dress{}

      iex> get_dress!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dress!(id), do: Repo.get!(Dress, id)

  @doc """
  Creates a dress.

  ## Examples

      iex> create_dress(%{field: value})
      {:ok, %Dress{}}

      iex> create_dress(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dress(attrs \\ %{}) do
    %Dress{}
    |> Dress.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dress.

  ## Examples

      iex> update_dress(dress, %{field: new_value})
      {:ok, %Dress{}}

      iex> update_dress(dress, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dress(%Dress{} = dress, attrs) do
    dress
    |> Dress.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a dress.

  ## Examples

      iex> delete_dress(dress)
      {:ok, %Dress{}}

      iex> delete_dress(dress)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dress(%Dress{} = dress) do
    Repo.delete(dress)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dress changes.

  ## Examples

      iex> change_dress(dress)
      %Ecto.Changeset{source: %Dress{}}

  """
  def change_dress(%Dress{} = dress) do
    Dress.changeset(dress, %{})
  end
end
