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

# Import Tops
File.stream!("assets/static/data/tops.csv")
|> CSV.decode!(headers: true)
|> Enum.each(fn row ->

  row
  |> Map.put("source_id", SeedHelper.get_source_id(row["source"]))
  |> Map.delete("source")
  |> AcCatalog.Tops.create_top
end)

# Import Bottoms
File.stream!("assets/static/data/bottoms.csv")
|> CSV.decode!(headers: true)
|> Enum.each(fn row ->

  row
  |> Map.put("source_id", SeedHelper.get_source_id(row["source"]))
  |> Map.delete("source")
  |> AcCatalog.Bottoms.create_bottom
end)

# Import Dresses
File.stream!("assets/static/data/dresses.csv")
|> CSV.decode!(headers: true)
|> Enum.each(fn row ->

  row
  |> Map.put("source_id", SeedHelper.get_source_id(row["source"]))
  |> Map.delete("source")
  |> AcCatalog.Dresses.create_dress
end)

# Import Headwear
File.stream!("assets/static/data/headwear.csv")
|> CSV.decode!(headers: true)
|> Enum.each(fn row ->

  row
  |> Map.put("source_id", SeedHelper.get_source_id(row["source"]))
  |> Map.delete("source")
  |> AcCatalog.Headwears.create_headwear
end)

# Import Accessories
File.stream!("assets/static/data/accessories.csv")
|> CSV.decode!(headers: true)
|> Enum.each(fn row ->

  row
  |> Map.put("source_id", SeedHelper.get_source_id(row["source"]))
  |> Map.delete("source")
  |> AcCatalog.Accessories.create_accessory
end)

# Import Socks
File.stream!("assets/static/data/socks.csv")
|> CSV.decode!(headers: true)
|> Enum.each(fn row ->

  row
  |> Map.put("source_id", SeedHelper.get_source_id(row["source"]))
  |> Map.delete("source")
  |> AcCatalog.Socks.create_sock
end)

# Import Shoes
File.stream!("assets/static/data/shoes.csv")
|> CSV.decode!(headers: true)
|> Enum.each(fn row ->

  row
  |> Map.put("source_id", SeedHelper.get_source_id(row["source"]))
  |> Map.delete("source")
  |> AcCatalog.Shoes.create_shoe
end)

# Import Bags
File.stream!("assets/static/data/bags.csv")
|> CSV.decode!(headers: true)
|> Enum.each(fn row ->

  row
  |> Map.put("source_id", SeedHelper.get_source_id(row["source"]))
  |> Map.delete("source")
  |> AcCatalog.Bags.create_bag
end)

# Import Umbrellas
File.stream!("assets/static/data/umbrellas.csv")
|> CSV.decode!(headers: true)
|> Enum.each(fn row ->

  row
  |> Map.put("source_id", SeedHelper.get_source_id(row["source"]))
  |> Map.delete("source")
  |> AcCatalog.Umbrellas.create_umbrella
end)
