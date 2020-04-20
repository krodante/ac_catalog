defmodule AcCatalog.Bottoms do
  @moduledoc """
  The Bottoms context.
  """

  import Ecto.Query, warn: false
  alias AcCatalog.Repo

  alias AcCatalog.Bottoms.Bottom

  @doc """
  Returns the list of bottoms.

  ## Examples

      iex> list_bottoms()
      [%Bottom{}, ...]

  """
  def list_bottoms do
    Repo.all(Bottom)
  end

  @doc """
  Gets a single bottom.

  Raises `Ecto.NoResultsError` if the Bottom does not exist.

  ## Examples

      iex> get_bottom!(123)
      %Bottom{}

      iex> get_bottom!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bottom!(id), do: Repo.get!(Bottom, id)

  @doc """
  Creates a bottom.

  ## Examples

      iex> create_bottom(%{field: value})
      {:ok, %Bottom{}}

      iex> create_bottom(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bottom(attrs \\ %{}) do
    %Bottom{}
    |> Bottom.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bottom.

  ## Examples

      iex> update_bottom(bottom, %{field: new_value})
      {:ok, %Bottom{}}

      iex> update_bottom(bottom, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bottom(%Bottom{} = bottom, attrs) do
    bottom
    |> Bottom.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bottom.

  ## Examples

      iex> delete_bottom(bottom)
      {:ok, %Bottom{}}

      iex> delete_bottom(bottom)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bottom(%Bottom{} = bottom) do
    Repo.delete(bottom)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bottom changes.

  ## Examples

      iex> change_bottom(bottom)
      %Ecto.Changeset{source: %Bottom{}}

  """
  def change_bottom(%Bottom{} = bottom) do
    Bottom.changeset(bottom, %{})
  end
end
