defmodule AcCatalog.Repo.Migrations.CreateHeadwears do
  use Ecto.Migration

  def change do
    create table(:headwears) do
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
