defmodule AcCatalog.Repo.Migrations.CreateWallMounteds do
  use Ecto.Migration

  def change do
    create table(:wall_mounteds) do
      add :name, :string
      add :variation, :string
      add :buy_price, :integer
      add :sell_price, :integer
      add :size, :string
      add :source_id, :integer
      add :filename, :string

      timestamps()
    end

  end
end
