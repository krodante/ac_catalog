defmodule AcCatalogWeb.ClothingView do
  use AcCatalogWeb, :view
  use Phoenix.HTML

  def show_owned(conn, clothing_id, table_name) do
    case Pow.Plug.current_user(conn) do
      nil -> link "Sign in", to: Routes.pow_session_path(conn, :new)
      current_user ->
        category_column = String.to_atom("owned_#{table_name}_ids")

        owned_ids = Map.get(current_user, category_column)

        case owned?(owned_ids, clothing_id) do
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

  def owned?(owned_ids, clothing_id), do: Enum.member?(owned_ids, clothing_id)

  def has_variation?(clothing), do: Map.has_key?(clothing, :variation)
end
