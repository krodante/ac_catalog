defmodule AcCatalog.Housewares do
  @moduledoc """
  The Housewares context.
  """

  import Ecto.Query, warn: false
  alias AcCatalog.Repo

  alias AcCatalog.Housewares.Houseware

  def get_housewares(ids) do
    from(h in Houseware, where: h.id in ^ids)
    |> Repo.all
  end

  @doc """
  Returns the list of housewares.

  ## Examples

      iex> list_housewares()
      [%Houseware{}, ...]

  """
  def list_housewares do
    Repo.all(Houseware)
  end

  @doc """
  Gets a single houseware.

  Raises `Ecto.NoResultsError` if the Houseware does not exist.

  ## Examples

      iex> get_houseware!(123)
      %Houseware{}

      iex> get_houseware!(456)
      ** (Ecto.NoResultsError)

  """
  def get_houseware!(id), do: Repo.get!(Houseware, id)

  @doc """
  Creates a houseware.

  ## Examples

      iex> create_houseware(%{field: value})
      {:ok, %Houseware{}}

      iex> create_houseware(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_houseware(attrs \\ %{}) do
    %Houseware{}
    |> Houseware.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a houseware.

  ## Examples

      iex> update_houseware(houseware, %{field: new_value})
      {:ok, %Houseware{}}

      iex> update_houseware(houseware, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_houseware(%Houseware{} = houseware, attrs) do
    houseware
    |> Houseware.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a houseware.

  ## Examples

      iex> delete_houseware(houseware)
      {:ok, %Houseware{}}

      iex> delete_houseware(houseware)
      {:error, %Ecto.Changeset{}}

  """
  def delete_houseware(%Houseware{} = houseware) do
    Repo.delete(houseware)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking houseware changes.

  ## Examples

      iex> change_houseware(houseware)
      %Ecto.Changeset{source: %Houseware{}}

  """
  def change_houseware(%Houseware{} = houseware) do
    Houseware.changeset(houseware, %{})
  end
end
