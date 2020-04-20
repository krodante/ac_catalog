defmodule AcCatalog.Repo.Migrations.AddOwnedClothingIdsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :owned_accessories_ids, {:array, :integer}, default: []
      add :owned_bags_ids, {:array, :integer}, default: []
      add :owned_bottoms_ids, {:array, :integer}, default: []
      add :owned_dresses_ids, {:array, :integer}, default: []
      add :owned_headwears_ids, {:array, :integer}, default: []
      add :owned_shoes_ids, {:array, :integer}, default: []
      add :owned_socks_ids, {:array, :integer}, default: []
      add :owned_tops_ids, {:array, :integer}, default: []
      add :owned_umbrellas_ids, {:array, :integer}, default: []
    end
  end
end
