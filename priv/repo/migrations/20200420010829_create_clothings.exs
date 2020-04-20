defmodule AcCatalog.Repo.Migrations.CreateClothings do
  use Ecto.Migration

  def change do
    create table(:clothings) do
      add :name, :string
      add :buy_price, :integer
      add :sell_price, :integer
      add :source_id, :integer
      add :style_id, :integer
      add :variation, :string
      add :filename, :string

      timestamps()
    end

  end
end
