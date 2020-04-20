defmodule AcCatalog.Repo.Migrations.AddOwnedFurnitureIdsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :owned_floors_ids, {:array, :integer}, default: []
      add :owned_housewares_ids, {:array, :integer}, default: []
      add :owned_misc_furnitures_ids, {:array, :integer}, default: []
      add :owned_musics_ids, {:array, :integer}, default: []
      add :owned_rugs_ids, {:array, :integer}, default: []
      add :owned_wall_mounteds_ids, {:array, :integer}, default: []
      add :owned_wallpapers_ids, {:array, :integer}, default: []
    end
  end
end
