defmodule AcCatalog.Repo.Migrations.RemoveStyleColumns do
  use Ecto.Migration

  def up do
    alter table("accessories"), do: remove(:style_id)
    alter table("bags"), do: remove(:style_id)
    alter table("bottoms"), do: remove(:style_id)
    alter table("dresses"), do: remove(:style_id)
    alter table("headwears"), do: remove(:style_id)
    alter table("shoes"), do: remove(:style_id)
    alter table("socks"), do: remove(:style_id)
    alter table("tops"), do: remove(:style_id)
  end

  def down do
    alter table("accessories"), do: add(:style_id, :integer)
    alter table("bags"), do: add(:style_id, :integer)
    alter table("bottoms"), do: add(:style_id, :integer)
    alter table("dresses"), do: add(:style_id, :integer)
    alter table("headwears"), do: add(:style_id, :integer)
    alter table("shoes"), do: add(:style_id, :integer)
    alter table("socks"), do: add(:style_id, :integer)
    alter table("tops"), do: add(:style_id, :integer)
  end

end
