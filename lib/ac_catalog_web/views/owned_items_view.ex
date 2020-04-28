defmodule AcCatalogWeb.OwnedItemsView do
  use AcCatalogWeb, :view

  @modules ["Accessories", "Achievements", "Art", "Bags", "Bottoms", "Construction",
 "Dresses", "Fencing", "Fish", "Floors", "Fossils", "Headwear",
 "Housewares", "Miscellaneous", "Music", "Nook Miles", "Photos", "Posters",
 "Recipes", "Rugs", "Shoes", "Socks", "Tools", "Tops", "Umbrellas",
 "Wall-mounted", "Wallpapers"]

  def csv_module(module) do
    case module do
      "Fossils" -> "fossils_mounteds"
      "Nook Miles" -> "nook_miles"
      "Wall-mounted" -> "wall_mounted"
      _ -> String.downcase(module)
    end
  end

  def show_owned_items(conn, user) do
    Enum.map(@modules, fn module ->
      column_name = String.to_existing_atom("#{csv_module(module)}_ids")
      ids = Map.get(user, column_name)

      File.stream!("assets/static/data/#{module}-Table 1.csv")
      |> CSV.decode!(headers: true)
      |> Enum.filter(fn row ->
        Enum.member?(ids, row["Unique Entry ID"])
      end)
      |> Enum.map(fn item ->
        content_tag(:tr) do
          [
            content_tag(:td, img_tag("https://acnhcdn.com/latest/FtrIcon/#{row["Filename"]}.png", class: "item")),
            content_tag(:td, item["Name"]),
            content_tag(:td, item["Variation"]),
            content_tag(:td, item["Buy"]),
            content_tag(:td, item["Sell"]),
            content_tag(:td, item["Source"]),
            content_tag(:td, remove_link(conn, csv_module(module), item["Unique Entry ID"]))
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

  def remove_link(conn, module, id) do
    case conn.assigns.current_user do
      nil -> ""
      _user ->
        link(" Remove", to: "/furniture/#{module}/remove/#{id}", method: :put)
    end
  end
end
