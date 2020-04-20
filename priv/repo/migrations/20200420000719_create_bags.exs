defmodule AcCatalog.Repo.Migrations.CreateBags do
  use Ecto.Migration

  def change do
    create table(:bags) do
      add :name, :string
      add :buy_price, :integer
      add :sell_price, :integer
      add :source_id, :integer
      add :style_id, :integer
      add :filename, :string

      timestamps()
    end

  end
end
