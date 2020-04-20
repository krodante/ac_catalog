defmodule AcCatalog.Repo.Migrations.CreateFloors do
  use Ecto.Migration

  def change do
    create table(:floors) do
      add :name, :string
      add :buy_price, :integer
      add :sell_price, :integer
      add :source_id, :integer
      add :filename, :string

      timestamps()
    end

  end
end
