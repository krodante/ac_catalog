defmodule AcCatalogWeb.ClothingView do
  use AcCatalogWeb, :view
  use Phoenix.HTML
  import AcCatalogWeb.Router.Helpers, only: [static_path: 2]

  def show_owned(conn, clothing_id, table_name) do
    case Pow.Plug.current_user(conn) do
      nil -> "You must sign in to use this feature"
      current_user ->
        category_column = String.to_atom("owned_#{table_name}_ids")

        owned_ids = Map.get(current_user, category_column)

        case owned?(current_user, table_name, clothing_id) do
          true ->
            content_tag(:div) do
              [
                img_tag(AcCatalogWeb.Router.Helpers.static_path(conn, "/images/green-check-icon.png"), class: "icon"),
                content_tag(:span) do
                  link " Remove", to: "/clothing/#{table_name}/remove/#{clothing_id}", method: :put
                end
              ]
            end
          false ->
            content_tag(:div) do
              [
                img_tag(AcCatalogWeb.Router.Helpers.static_path(conn, "/images/red-x-icon.png"), class: "icon"),
                content_tag(:span) do
                  link " Add", to: "/clothing/#{table_name}/add/#{clothing_id}", method: :put
                end
              ]
            end
        end
    end
  end

  def owned?(current_user, table_name, clothing_id) do
    category_column = String.to_atom("owned_#{table_name}_ids")

    owned_ids = Map.get(current_user, category_column)

    Enum.member?(owned_ids, clothing_id)
  end
end
