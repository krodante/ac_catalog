defmodule AcCatalog.Headwears do
  @moduledoc """
  The Headwears context.
  """

  import Ecto.Query, warn: false
  alias AcCatalog.Repo

  alias AcCatalog.Headwears.Headwear

  def get_headwears(ids) do
    from(h in Headwear, where: h.id in ^ids)
    |> Repo.all
  end

  @doc """
  Returns the list of headwears.

  ## Examples

      iex> list_headwears()
      [%Headwear{}, ...]

  """
  def list_headwears do
    Repo.all(Headwear)
  end

  @doc """
  Gets a single headwear.

  Raises `Ecto.NoResultsError` if the Headwear does not exist.

  ## Examples

      iex> get_headwear!(123)
      %Headwear{}

      iex> get_headwear!(456)
      ** (Ecto.NoResultsError)

  """
  def get_headwear!(id), do: Repo.get!(Headwear, id)

  @doc """
  Creates a headwear.

  ## Examples

      iex> create_headwear(%{field: value})
      {:ok, %Headwear{}}

      iex> create_headwear(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_headwear(attrs \\ %{}) do
    %Headwear{}
    |> Headwear.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a headwear.

  ## Examples

      iex> update_headwear(headwear, %{field: new_value})
      {:ok, %Headwear{}}

      iex> update_headwear(headwear, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_headwear(%Headwear{} = headwear, attrs) do
    headwear
    |> Headwear.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a headwear.

  ## Examples

      iex> delete_headwear(headwear)
      {:ok, %Headwear{}}

      iex> delete_headwear(headwear)
      {:error, %Ecto.Changeset{}}

  """
  def delete_headwear(%Headwear{} = headwear) do
    Repo.delete(headwear)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking headwear changes.

  ## Examples

      iex> change_headwear(headwear)
      %Ecto.Changeset{source: %Headwear{}}

  """
  def change_headwear(%Headwear{} = headwear) do
    Headwear.changeset(headwear, %{})
  end
end
