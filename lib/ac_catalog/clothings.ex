defmodule AcCatalog.Clothings do
  @moduledoc """
  The Clothings context.
  """

  import Ecto.Query, warn: false
  alias AcCatalog.Repo

  alias AcCatalog.Clothings.Clothing

  @clothing_modules [
    "Accessories",
    "Bags",
    "Bottoms",
    "Dresses",
    "Headwears",
    "Shoes",
    "Socks",
    "Tops",
    "Umbrellas"
  ]

  def list_owned_clothing(user) do
    @clothing_modules
    |> Enum.flat_map(fn module ->
      table_name = Macro.underscore(module)
      function = "get_#{table_name}"
      column_name = String.to_existing_atom("owned_#{table_name}_ids")

      owned_ids = Map.get(user, column_name)

      apply(String.to_existing_atom("Elixir.AcCatalog.#{module}"), String.to_existing_atom(function), [owned_ids])
    end)
  end

  @doc """
  Returns the list of clothings.

  ## Examples

      iex> list_clothings()
      [%Clothing{}, ...]

  """
  def list_clothings do
    Repo.all(Clothing)
  end

  @doc """
  Gets a single clothing.

  Raises `Ecto.NoResultsError` if the Clothing does not exist.

  ## Examples

      iex> get_clothing!(123)
      %Clothing{}

      iex> get_clothing!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clothing!(id), do: Repo.get!(Clothing, id)

  @doc """
  Creates a clothing.

  ## Examples

      iex> create_clothing(%{field: value})
      {:ok, %Clothing{}}

      iex> create_clothing(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clothing(attrs \\ %{}) do
    %Clothing{}
    |> Clothing.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a clothing.

  ## Examples

      iex> update_clothing(clothing, %{field: new_value})
      {:ok, %Clothing{}}

      iex> update_clothing(clothing, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clothing(%Clothing{} = clothing, attrs) do
    clothing
    |> Clothing.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a clothing.

  ## Examples

      iex> delete_clothing(clothing)
      {:ok, %Clothing{}}

      iex> delete_clothing(clothing)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clothing(%Clothing{} = clothing) do
    Repo.delete(clothing)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clothing changes.

  ## Examples

      iex> change_clothing(clothing)
      %Ecto.Changeset{source: %Clothing{}}

  """
  def change_clothing(%Clothing{} = clothing) do
    Clothing.changeset(clothing, %{})
  end
end
