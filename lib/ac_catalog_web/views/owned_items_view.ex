defmodule AcCatalogWeb.OwnedItemsView do
  use AcCatalogWeb, :view

  @csv_names Application.get_env(:ac_catalog, :app_vars)[:csv_names]

  def show_owned_items(conn, user) do
    Enum.map(@csv_names, fn csv_name ->
      column_name = String.to_existing_atom("#{AcCatalog.column_names_from(csv_name)}_ids")
      ids = Map.get(user, column_name)

      File.stream!("assets/static/data/#{csv_name}-Table 1.csv")
      |> CSV.decode!(headers: true)
      |> Enum.filter(fn row ->
        Enum.member?(ids, row["Unique Entry ID"])
      end)
      |> Enum.map(fn item ->
        content_tag(:tr) do
          [
            content_tag(:td, img_tag("https://acnhcdn.com/latest/FtrIcon/#{item["Filename"]}.png", class: "item")),
            content_tag(:td, item["Name"]),
            content_tag(:td, item["Variation"]),
            content_tag(:td, item["Buy"]),
            content_tag(:td, item["Sell"]),
            content_tag(:td, item["Source"]),
            content_tag(:td, remove_link(conn, AcCatalog.column_names_from(csv_name), item["Unique Entry ID"]))
          ]
        end
      end)
    end)
  end

  def share_items_link(conn) do
    case conn.assigns.current_user do
      nil -> ""
      user -> link("Share My Items", to: Routes.shareable_link_path(conn, :index, user.id), target: "_blank")
    end
  end

  def remove_link(conn, column_name, id) do
    case conn.assigns.current_user do
      nil -> ""
      _user ->
        link(" Remove", to: "/owned_items/#{column_name}/remove/#{id}", method: :put)
    end
  end
end
