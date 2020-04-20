defmodule AcCatalog.Repo.Migrations.CreateWallpapers do
  use Ecto.Migration

  def change do
    create table(:wallpapers) do
      add :name, :string
      add :buy_price, :integer
      add :sell_price, :integer
      add :source_id, :integer
      add :filename, :string

      timestamps()
    end

  end
end
