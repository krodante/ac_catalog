defmodule AcCatalogWeb.OwnedItemsController do
  use AcCatalogWeb, :controller

  alias AcCatalog.Accounts.User

  plug :reload_user

  defp reload_user(conn, _opts) do
    config = Pow.Plug.fetch_config(conn)

    case Pow.Plug.current_user(conn, config) do
      nil -> conn
      user ->
        reloaded_user = AcCatalog.Repo.get!(AcCatalog.Accounts.User, user.id)

        Pow.Plug.assign_current_user(conn, reloaded_user, config)
    end
  end

  def index(conn, %{"shared_user_id" => user_id}) do
    user = AcCatalog.Repo.get!(User, user_id)

    render(conn, "index.html", user: user)
  end

  def index(conn, _params) do
    current_user = Pow.Plug.current_user(conn)

    render(conn, "index.html", user: current_user)
  end

  def add(conn, params) do
    mutate(conn, params, :++)
  end

  def remove(conn, params) do
    mutate(conn, params, :--)
  end

  def mutate(conn, params, operation) do
    table_name = params["module"]
    id = params["id"]
    current_user = conn.assigns.current_user

    table_name_column = String.to_existing_atom("#{table_name}_ids")

    owned_ids = Map.get(current_user, table_name_column)
    new_ids = apply(Kernel, operation, [owned_ids, [id]]) |> Enum.uniq

    new_data = Map.new(
      [
        {table_name_column, new_ids}
      ]
    )

    changeset = AcCatalog.Accounts.User.item_changeset(current_user, new_data)

    {:ok, _user} = AcCatalog.Repo.update(changeset)

    conn
    |> put_flash(:info, "Item updated successfully.")
    |> redirect(to: NavigationHistory.last_path(conn))
  end
end
