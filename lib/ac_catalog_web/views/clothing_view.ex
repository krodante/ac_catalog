defmodule AcCatalogWeb.ClothingView do
  use AcCatalogWeb, :view

  def owned?(conn, clothing_id, table_name) do
    case Pow.Plug.current_user(conn) do
      nil -> "You must sign in to use this feature"
      current_user ->
        IO.inspect current_user
        Enum.member?(current_user.owned_tops_ids, clothing_id)
    end
  end
end
