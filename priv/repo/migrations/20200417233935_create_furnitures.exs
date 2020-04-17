defmodule AcCatalog.Repo.Migrations.CreateFurnitures do
  use Ecto.Migration

  def change do
    create table(:furnitures) do
      add :name, :string
      add :category_id, :integer
      add :buy_price, :integer
      add :sell_price, :integer
      add :source_id, :integer
      add :variation, :string
      add :customization_cost, :integer
      add :size, :string

      timestamps()
    end

  end
end
