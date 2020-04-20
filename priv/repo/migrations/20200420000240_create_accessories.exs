defmodule AcCatalog.Repo.Migrations.CreateAccessories do
  use Ecto.Migration

  def change do
    create table(:accessories) do
      add :name, :string
      add :variation, :string
      add :buy_price, :integer
      add :sell_price, :integer
      add :source_id, :integer
      add :style_id, :integer
      add :filename, :string

      timestamps()
    end

  end
end
