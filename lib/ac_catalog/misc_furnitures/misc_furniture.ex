defmodule AcCatalog.MiscFurnitures.MiscFurniture do
  use Ecto.Schema
  import Ecto.Changeset

  schema "misc_furniture" do
    field :buy_price, :integer
    field :filename, :string
    field :name, :string
    field :sell_price, :integer
    field :size, :string
    field :source_id, :integer
    field :variation, :string

    timestamps()
  end

  @doc false
  def changeset(misc_furniture, attrs) do
    misc_furniture
    |> cast(attrs, [:name, :variation, :buy_price, :sell_price, :size, :source_id, :filename])
    |> validate_required([:name, :variation, :buy_price, :sell_price, :size, :source_id, :filename])
  end
end
