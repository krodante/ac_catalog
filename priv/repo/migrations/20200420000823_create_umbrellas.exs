defmodule AcCatalog.Repo.Migrations.CreateUmbrellas do
  use Ecto.Migration

  def change do
    create table(:umbrellas) do
      add :name, :string
      add :buy_price, :integer
      add :sell_price, :integer
      add :source_id, :integer
      add :filename, :string

      timestamps()
    end

  end
end
