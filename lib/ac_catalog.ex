defmodule AcCatalog do
  @moduledoc """
  AcCatalog keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def column_names_from(csv_name) do
    case csv_name do
      "Fossils" -> "fossils_mounteds"
      "Nook Miles" -> "nook_miles"
      "Wall-mounted" -> "wall_mounted"
      _ -> String.downcase(csv_name)
    end
  end

  def csv_name_from(column_name) do
    case column_name do
      "fossils_mounteds" -> "Fossils"
      "nook_miles" -> "Nook Miles"
      "wall_mounted" -> "Wall-mounted"
      _ -> String.capitalize(column_name)
    end
  end
end
