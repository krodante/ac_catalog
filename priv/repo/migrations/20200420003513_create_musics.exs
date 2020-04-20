defmodule AcCatalog.Repo.Migrations.CreateMusics do
  use Ecto.Migration

  def change do
    create table(:musics) do
      add :name, :string
      add :buy_price, :integer
      add :sell_price, :integer
      add :source_id, :integer
      add :filename, :string

      timestamps()
    end

  end
end
