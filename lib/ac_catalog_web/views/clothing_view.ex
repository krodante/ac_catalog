defmodule AcCatalogWeb.ClothingView do
  use AcCatalogWeb, :view
  use Phoenix.HTML

  def show_items(conn, category, table_name) do
    File.stream!("assets/static/data/#{String.capitalize(category)}-Table 1.csv")
    |> CSV.decode!(headers: true)
    |> Enum.map(fn row ->
      content_tag(:tr) do
        [
          content_tag(:td, img_tag("https://acnhcdn.com/latest/FtrIcon/#{row["Filename"]}.png", class: "item")),
          content_tag(:td, row["Name"]),
          content_tag(:td, row["Variation"]),
          content_tag(:td, row["Buy"]),
          content_tag(:td, row["Sell"]),
          content_tag(:td, row["Source"]),
          content_tag(:td, show_owned(conn, row["Unique Entry ID"], category))
        ]
      end
    end)
  end

  def show_owned(conn, id, module) do
    case Pow.Plug.current_user(conn) do
      nil -> link "Sign in", to: Routes.pow_session_path(conn, :new)
      current_user ->
        category_column = String.to_existing_atom("#{module}_ids")

        owned_ids = Map.get(current_user, category_column)

        case owned?(owned_ids, id) do
          true ->
            content_tag(:div) do
              [
                img_tag(AcCatalogWeb.Router.Helpers.static_path(conn, "/images/green-check-icon.png"), class: "icon"),
                content_tag(:span) do
                  link(" Remove", to: "/furniture/#{module}/remove/#{id}", method: :put)
                end
              ]
            end
          false ->
            content_tag(:div) do
              [
                img_tag(AcCatalogWeb.Router.Helpers.static_path(conn, "/images/red-x-icon.png"), class: "icon"),
                content_tag(:span) do
                  link " Add", to: "/furniture/#{module}/add/#{id}", method: :put
                end
              ]
            end
        end
    end
  end

  def owned?(owned_ids, clothing_id), do: Enum.member?(owned_ids, clothing_id)

  def has_variation?(clothing), do: Map.has_key?(clothing, :variation)
end
