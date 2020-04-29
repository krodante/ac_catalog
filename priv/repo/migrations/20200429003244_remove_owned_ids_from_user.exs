defmodule AcCatalog.Repo.Migrations.RemoveOwnedIdsFromUser do
  use Ecto.Migration

  def change do
    rename table("users"), :fossils_mounteds_ids, to: :fossils_ids

    alter table(:users) do
      remove :owned_accessories_ids
      remove :owned_bags_ids
      remove :owned_bottoms_ids
      remove :owned_dresses_ids
      remove :owned_headwears_ids
      remove :owned_shoes_ids
      remove :owned_socks_ids
      remove :owned_tops_ids
      remove :owned_umbrellas_ids

      remove :owned_floors_ids
      remove :owned_housewares_ids
      remove :owned_misc_furnitures_ids
      remove :owned_musics_ids
      remove :owned_rugs_ids
      remove :owned_wall_mounteds_ids
      remove :owned_wallpapers_ids
    end
  end
end
