defmodule AcCatalog.Accessories.Accessory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accessories" do
    field :buy_price, :integer
    field :filename, :string
    field :name, :string
    field :sell_price, :integer
    field :source_id, :integer
    field :variation, :string

    timestamps()
  end

  @doc false
  def changeset(accessory, attrs) do
    accessory
    |> cast(attrs, [:name, :variation, :buy_price, :sell_price, :source_id, :filename])
    |> validate_required([:name, :variation, :buy_price, :sell_price, :source_id, :filename])
  end
end
