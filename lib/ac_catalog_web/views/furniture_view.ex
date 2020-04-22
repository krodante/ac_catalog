defmodule AcCatalogWeb.FurnitureView do
  use AcCatalogWeb, :view

  def show_owned(conn, furniture_id, table_name) do
    case Pow.Plug.current_user(conn) do
      nil -> link "Sign in", to: Routes.pow_session_path(conn, :new)
      current_user ->
        category_column = String.to_existing_atom("owned_#{table_name}_ids")

        owned_ids = Map.get(current_user, category_column)

        case owned?(owned_ids, furniture_id) do
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

  def owned?(owned_ids, clothing_id), do: Enum.member?(owned_ids, clothing_id)
end
