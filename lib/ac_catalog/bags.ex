defmodule AcCatalog.Bags do
  @moduledoc """
  The Bags context.
  """

  import Ecto.Query, warn: false
  alias AcCatalog.Repo

  alias AcCatalog.Bags.Bag

  def get_bags(ids) do
    from(b in Bag, where: b.id in ^ids)
    |> Repo.all
  end

  @doc """
  Returns the list of bags.

  ## Examples

      iex> list_bags()
      [%Bag{}, ...]

  """
  def list_bags do
    Repo.all(Bag)
  end

  @doc """
  Gets a single bag.

  Raises `Ecto.NoResultsError` if the Bag does not exist.

  ## Examples

      iex> get_bag!(123)
      %Bag{}

      iex> get_bag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bag!(id), do: Repo.get!(Bag, id)

  @doc """
  Creates a bag.

  ## Examples

      iex> create_bag(%{field: value})
      {:ok, %Bag{}}

      iex> create_bag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bag(attrs \\ %{}) do
    %Bag{}
    |> Bag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bag.

  ## Examples

      iex> update_bag(bag, %{field: new_value})
      {:ok, %Bag{}}

      iex> update_bag(bag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bag(%Bag{} = bag, attrs) do
    bag
    |> Bag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bag.

  ## Examples

      iex> delete_bag(bag)
      {:ok, %Bag{}}

      iex> delete_bag(bag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bag(%Bag{} = bag) do
    Repo.delete(bag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bag changes.

  ## Examples

      iex> change_bag(bag)
      %Ecto.Changeset{source: %Bag{}}

  """
  def change_bag(%Bag{} = bag) do
    Bag.changeset(bag, %{})
  end
end
