defmodule AcCatalog.Styles do
  @moduledoc """
  The Styles context.
  """

  import Ecto.Query, warn: false
  alias AcCatalog.Repo

  alias AcCatalog.Styles.Style

  def get_or_insert_by_name(name) do
    case Repo.get_by(Style, name: name) do
      nil -> create_style(%{name: name})
      style -> {:ok, style}
    end
  end

  @doc """
  Returns the list of styles.

  ## Examples

      iex> list_styles()
      [%Style{}, ...]

  """
  def list_styles do
    Repo.all(Style)
  end

  @doc """
  Gets a single style.

  Raises `Ecto.NoResultsError` if the Style does not exist.

  ## Examples

      iex> get_style!(123)
      %Style{}

      iex> get_style!(456)
      ** (Ecto.NoResultsError)

  """
  def get_style!(id), do: Repo.get!(Style, id)

  @doc """
  Creates a style.

  ## Examples

      iex> create_style(%{field: value})
      {:ok, %Style{}}

      iex> create_style(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_style(attrs \\ %{}) do
    %Style{}
    |> Style.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a style.

  ## Examples

      iex> update_style(style, %{field: new_value})
      {:ok, %Style{}}

      iex> update_style(style, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_style(%Style{} = style, attrs) do
    style
    |> Style.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a style.

  ## Examples

      iex> delete_style(style)
      {:ok, %Style{}}

      iex> delete_style(style)
      {:error, %Ecto.Changeset{}}

  """
  def delete_style(%Style{} = style) do
    Repo.delete(style)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking style changes.

  ## Examples

      iex> change_style(style)
      %Ecto.Changeset{source: %Style{}}

  """
  def change_style(%Style{} = style) do
    Style.changeset(style, %{})
  end
end
