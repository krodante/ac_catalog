defmodule AcCatalog.Repo.Migrations.RemoveFurnitureAndClothing do
  use Ecto.Migration

  def change do
    drop table("furnitures")
    drop table("clothings")
    drop table("sources")
    drop table("tops")
    drop table("bottoms")
    drop table("dresses")
    drop table("headwears")
    drop table("accessories")
    drop table("socks")
    drop table("shoes")
    drop table("bags")
    drop table("musics")
    drop table("umbrellas")
    drop table("floors")
    drop table("housewares")
    drop table("wallpapers")
    drop table("rugs")
    drop table("wall_mounteds")
    drop table("misc_furniture")
  end
end
