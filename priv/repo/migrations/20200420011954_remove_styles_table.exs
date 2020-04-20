defmodule AcCatalog.Repo.Migrations.RemoveStylesTable do
  use Ecto.Migration

  def up do
    drop table("styles")
  end

  def down do
    create table("styles") do
      add :name, :string

      timestamps()
    end
  end

end
