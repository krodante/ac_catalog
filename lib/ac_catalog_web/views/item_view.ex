defmodule AcCatalogWeb.ItemView do
  use AcCatalogWeb, :view

  def show_items(conn, user) do
    column_name = List.first(conn.path_info)
    assigns = conn.assigns

    File.stream!("assets/static/data/#{AcCatalog.csv_name_from(column_name)}-Table 1.csv")
    |> CSV.decode!(headers: true)
    |> Enum.map(fn row ->
      content_tag(:tr) do
        [
          content_tag(:td, img_tag("https://acnhcdn.com/latest/FtrIcon/#{row["Filename"]}.png", class: "item")),
          content_tag(:td, row["Name"]),
          (if assigns.has_variation, do: content_tag(:td, row["Variation"]), else: ""),
          (if assigns.has_buy_price, do: content_tag(:td, row["Buy"]), else: ""),
          (if assigns.has_sell_price, do: content_tag(:td, row["Sell"]), else: ""),
          (if assigns.has_source, do: content_tag(:td, row["Source"]), else: ""),
          content_tag(:td, show_owned(conn, row["Unique Entry ID"], column_name))
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
                  link(" Remove", to: "/owned_items/#{module}/remove/#{id}", method: :put)
                end
              ]
            end
          false ->
            content_tag(:div) do
              [
                img_tag(AcCatalogWeb.Router.Helpers.static_path(conn, "/images/red-x-icon.png"), class: "icon"),
                content_tag(:span) do
                  link " Add", to: "/owned_items/#{module}/add/#{id}", method: :put
                end
              ]
            end
        end
    end
  end

  def owned?(owned_ids, clothing_id), do: Enum.member?(owned_ids, clothing_id)
end
