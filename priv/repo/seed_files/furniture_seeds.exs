# Script for populating the database. You can run it as:
#
# mix run priv/repo/seed_files/clothing_seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     AcCatalog.Repo.insert!(%AcCatalog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule SeedHelper do
  def get_source_id(source) do
    {:ok, source} = AcCatalog.Sources.get_or_insert_by_name(source)
    source.id
  end
end

# Import Music
File.stream!("priv/static/data/music.csv")
|> CSV.decode!(headers: true)
|> Enum.each(fn row ->

  row
  |> Map.put("source_id", SeedHelper.get_source_id(row["source"]))
  |> Map.delete("source")
  |> AcCatalog.Musics.create_music
end)

# Import Floor
File.stream!("priv/static/data/floors.csv")
|> CSV.decode!(headers: true)
|> Enum.each(fn row ->

  row
  |> Map.put("source_id", SeedHelper.get_source_id(row["source"]))
  |> Map.delete("source")
  |> AcCatalog.Floors.create_floor
end)

# Import Wallpaper
File.stream!("priv/static/data/wallpaper.csv")
|> CSV.decode!(headers: true)
|> Enum.each(fn row ->

  row
  |> Map.put("source_id", SeedHelper.get_source_id(row["source"]))
  |> Map.delete("source")
  |> AcCatalog.Wallpapers.create_wallpaper
end)

# Import Rugs
File.stream!("priv/static/data/rugs.csv")
|> CSV.decode!(headers: true)
|> Enum.each(fn row ->

  row
  |> Map.put("source_id", SeedHelper.get_source_id(row["source"]))
  |> Map.delete("source")
  |> AcCatalog.Rugs.create_rug
end)

# Import Wall-Mounted
File.stream!("priv/static/data/wall-mounted.csv")
|> CSV.decode!(headers: true)
|> Enum.each(fn row ->

  row
  |> Map.put("source_id", SeedHelper.get_source_id(row["source"]))
  |> Map.delete("source")
  |> AcCatalog.WallMounteds.create_wall_mounted
end)

# Import Miscellaneous Furniture
File.stream!("priv/static/data/miscellaneous.csv")
|> CSV.decode!(headers: true)
|> Enum.each(fn row ->

  row
  |> Map.put("source_id", SeedHelper.get_source_id(row["source"]))
  |> Map.delete("source")
  |> AcCatalog.MiscFurnitures.create_misc_furniture
end)

# Import Housewares
File.stream!("priv/static/data/housewares.csv")
|> CSV.decode!(headers: true)
|> Enum.each(fn row ->

  row
  |> Map.put("source_id", SeedHelper.get_source_id(row["source"]))
  |> Map.delete("source")
  |> AcCatalog.Housewares.create_houseware
end)
