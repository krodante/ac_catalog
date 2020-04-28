defmodule AcCatalog.Repo.Migrations.ChangeOwnedIds do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :accessories_ids, {:array, :string}, default: []
      add :bags_ids, {:array, :string}, default: []
      add :bottoms_ids, {:array, :string}, default: []
      add :dresses_ids, {:array, :string}, default: []
      add :headwear_ids, {:array, :string}, default: []
      add :shoes_ids, {:array, :string}, default: []
      add :socks_ids, {:array, :string}, default: []
      add :tops_ids, {:array, :string}, default: []
      add :umbrellas_ids, {:array, :string}, default: []

      add :floors_ids, {:array, :string}, default: []
      add :housewares_ids, {:array, :string}, default: []
      add :miscellaneous_ids, {:array, :string}, default: []
      add :music_ids, {:array, :string}, default: []
      add :rugs_ids, {:array, :string}, default: []
      add :wall_mounted_ids, {:array, :string}, default: []
      add :wallpapers_ids, {:array, :string}, default: []

      add :achievements_ids, {:array, :string}, default: []
      add :art_ids, {:array, :string}, default: []
      add :construction_ids, {:array, :string}, default: []
      add :fencing_ids, {:array, :string}, default: []
      add :fish_ids, {:array, :string}, default: []
      add :fossils_mounteds_ids, {:array, :string}, default: []
      add :nook_miles_ids, {:array, :string}, default: []
      add :photos_ids, {:array, :string}, default: []
      add :posters_ids, {:array, :string}, default: []
      add :recipes_ids, {:array, :string}, default: []
      add :tools_ids, {:array, :string}, default: []
    end
  end
end
