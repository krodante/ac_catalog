defmodule AcCatalog.Socks do
  @moduledoc """
  The Socks context.
  """

  import Ecto.Query, warn: false
  alias AcCatalog.Repo

  alias AcCatalog.Socks.Sock

  @doc """
  Returns the list of socks.

  ## Examples

      iex> list_socks()
      [%Sock{}, ...]

  """
  def list_socks do
    Repo.all(Sock)
  end

  @doc """
  Gets a single sock.

  Raises `Ecto.NoResultsError` if the Sock does not exist.

  ## Examples

      iex> get_sock!(123)
      %Sock{}

      iex> get_sock!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sock!(id), do: Repo.get!(Sock, id)

  @doc """
  Creates a sock.

  ## Examples

      iex> create_sock(%{field: value})
      {:ok, %Sock{}}

      iex> create_sock(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sock(attrs \\ %{}) do
    %Sock{}
    |> Sock.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sock.

  ## Examples

      iex> update_sock(sock, %{field: new_value})
      {:ok, %Sock{}}

      iex> update_sock(sock, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sock(%Sock{} = sock, attrs) do
    sock
    |> Sock.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sock.

  ## Examples

      iex> delete_sock(sock)
      {:ok, %Sock{}}

      iex> delete_sock(sock)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sock(%Sock{} = sock) do
    Repo.delete(sock)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sock changes.

  ## Examples

      iex> change_sock(sock)
      %Ecto.Changeset{source: %Sock{}}

  """
  def change_sock(%Sock{} = sock) do
    Sock.changeset(sock, %{})
  end
end
