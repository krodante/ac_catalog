defmodule SeedHelper do
  @modules [
    "Accessories",
    "Bags",
    "Bottoms",
    "Dresses",
    "Floors",
    "Headwears",
    "Housewares",
    "MiscFurnitures",
    "Musics",
    "Rugs",
    "Shoes",
    "Socks",
    "Tops",
    "Umbrellas",
    "WallMounteds",
    "Wallpapers"
  ]

  def csv_module(module) do
    case module do
      "Headwears" -> "Headwear"
      "MiscFurnitures" -> "Miscellaneous"
      "Musics" -> "Music"
      "WallMounteds" -> "Wall-mounted"
      _ -> module
    end
  end

  def function_name(module) do
    case module do
      "Accessories" -> "get_accessory!"
      "Dresses" -> "get_dress!"
      "MiscFurnitures" -> "get_misc_furniture!"
      "WallMounteds" -> "get_wall_mounted!"
      _ -> "get_#{Macro.underscore(module) |> String.trim_trailing("s")}!"
    end
  end

  def blah(user, module, column_name, new_column_name, old_ids, new_ids) when old_ids == [], do: IO.puts("Done!")

  def blah(user, module, column_name, new_column_name, old_ids, new_ids) do
    IO.inspect(old_ids)
    IO.inspect("module: #{module}")
    Enum.each(old_ids, fn owned_id ->
      IO.inspect("owned_id: #{owned_id}")
      function = function_name(module)
      new_column_name = "#{csv_module(module)}_ids" |> String.replace("-", "_") |> String.downcase |> String.to_existing_atom()

      owned_item = apply(String.to_existing_atom("Elixir.AcCatalog.#{module}"), String.to_existing_atom(function), [owned_id])

      filename = "assets/static/data/#{csv_module(module)}-Table 1.csv"

      csv_item = File.stream!(filename)
      |> CSV.decode!(headers: true)
      |> Enum.find(fn row ->
        if Map.has_key?(row, "Variation") do
          row["Name"] == owned_item.name and row["Variation"] == owned_item.variation
        else
          row["Filename"] == owned_item.filename
        end
      end)

      old_ids = old_ids -- [owned_id]

      new_data = new_ids ++ [csv_item["Unique Entry ID"]]

      changeset = AcCatalog.Accounts.User.item_changeset(user, %{new_column_name => new_data, column_name => old_ids})

      AcCatalog.Repo.update!(changeset)

      blah(user, module, column_name, new_column_name, old_ids, new_data)
    end)
  end

  def migrate_data(user) do
    @modules
    |> Enum.each(fn module ->
      column_name = String.to_existing_atom("owned_#{Macro.underscore(module)}_ids")
      new_column_name = "#{csv_module(module)}_ids" |> String.replace("-", "_") |> String.downcase |> String.to_existing_atom()
      old_ids = Map.get(user, column_name)
      new_ids = Map.get(user, new_column_name)

      blah(user, module, column_name, new_column_name, old_ids, new_ids)
    end)
  end
end

AcCatalog.Repo.all(AcCatalog.Accounts.User)
|> Enum.each(fn user -> SeedHelper.migrate_data(user) end)
AcCatalog.Repo.all(AcCatalog.Accounts.User) |> List.last |> IO.inspect
