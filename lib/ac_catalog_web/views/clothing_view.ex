defmodule AcCatalogWeb.ClothingView do
  use AcCatalogWeb, :view

  def owned?(conn, clothing_id, table_name) do
    case Pow.Plug.current_user(conn) do
      nil -> "You must sign in to use this feature"
      current_user ->
        category_column = String.to_atom("owned_#{table_name}_ids")

        owned_ids = Map.get(current_user, category_column)

        Enum.member?(owned_ids, clothing_id)
    end
  end
end
