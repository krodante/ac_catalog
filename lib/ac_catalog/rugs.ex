defmodule AcCatalog.Rugs do
  @moduledoc """
  The Rugs context.
  """

  import Ecto.Query, warn: false
  alias AcCatalog.Repo

  alias AcCatalog.Rugs.Rug

  @doc """
  Returns the list of rugs.

  ## Examples

      iex> list_rugs()
      [%Rug{}, ...]

  """
  def list_rugs do
    Repo.all(Rug)
  end

  @doc """
  Gets a single rug.

  Raises `Ecto.NoResultsError` if the Rug does not exist.

  ## Examples

      iex> get_rug!(123)
      %Rug{}

      iex> get_rug!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rug!(id), do: Repo.get!(Rug, id)

  @doc """
  Creates a rug.

  ## Examples

      iex> create_rug(%{field: value})
      {:ok, %Rug{}}

      iex> create_rug(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rug(attrs \\ %{}) do
    %Rug{}
    |> Rug.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rug.

  ## Examples

      iex> update_rug(rug, %{field: new_value})
      {:ok, %Rug{}}

      iex> update_rug(rug, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_rug(%Rug{} = rug, attrs) do
    rug
    |> Rug.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a rug.

  ## Examples

      iex> delete_rug(rug)
      {:ok, %Rug{}}

      iex> delete_rug(rug)
      {:error, %Ecto.Changeset{}}

  """
  def delete_rug(%Rug{} = rug) do
    Repo.delete(rug)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rug changes.

  ## Examples

      iex> change_rug(rug)
      %Ecto.Changeset{source: %Rug{}}

  """
  def change_rug(%Rug{} = rug) do
    Rug.changeset(rug, %{})
  end
end
