defmodule AcCatalogWeb.FurnitureView do
  use AcCatalogWeb, :view

  def show_owned(conn, furniture_id, table_name) do
    case Pow.Plug.current_user(conn) do
      nil -> "You must sign in to use this feature"
      current_user ->
        category_column = String.to_atom("owned_#{table_name}_ids")

        owned_ids = Map.get(current_user, category_column)

        case owned?(current_user, table_name, furniture_id) do
          true ->
            content_tag(:div) do
              [
                img_tag(AcCatalogWeb.Router.Helpers.static_path(conn, "/images/green-check-icon.png"), class: "icon"),
                content_tag(:span) do
                  link " Remove", to: "/furniture/#{table_name}/remove/#{furniture_id}", method: :put
                end
              ]
            end
          false ->
            content_tag(:div) do
              [
                img_tag(AcCatalogWeb.Router.Helpers.static_path(conn, "/images/red-x-icon.png"), class: "icon"),
                content_tag(:span) do
                  link " Add", to: "/furniture/#{table_name}/add/#{furniture_id}", method: :put
                end
              ]
            end
        end
    end
  end

  def owned?(current_user, table_name, furniture_id) do
    category_column = String.to_atom("owned_#{table_name}_ids")

    owned_ids = Map.get(current_user, category_column)

    Enum.member?(owned_ids, furniture_id)
  end
end
