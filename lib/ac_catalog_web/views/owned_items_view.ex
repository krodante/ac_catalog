defmodule AcCatalogWeb.OwnedItemsView do
  use AcCatalogWeb, :view

  def source_directory(source) do
    case source do
      "misc_furniture" -> "miscellaneous"
      "musics" -> "music"
      "wall_mounteds" -> "wall-mounted"
      "headwears" -> "headwear"
      _ -> source
    end
  end

  def owned_item_image(item) do
    img_tag("https://acnhcdn.com/acdb/#{source_directory(item.__meta__.source)}/#{item.filename}.png", class: "item")
  end

  def share_items_link(conn) do
    case conn.assigns.current_user do
      nil -> ""
      user -> link("Share My Items", to: Routes.shareable_link_path(conn, :index, user.id))
    end
  end

  def item_type(item) do
    String.capitalize(source_directory(item.__meta__.source))
  end

  def remove_link(conn, item) do
    case conn.assigns.current_user do
      nil -> ""
      _user ->
        source = item.__meta__.source
        link(" Remove", to: "/furniture/#{source}/remove/#{item.id}", method: :put)
    end
  end
end
