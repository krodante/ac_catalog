defmodule AcCatalog.Shoes.Shoe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shoes" do
    field :buy_price, :integer
    field :filename, :string
    field :name, :string
    field :sell_price, :integer
    field :source_id, :integer
    field :style_id, :integer
    field :variation, :string

    timestamps()
  end

  @doc false
  def changeset(shoe, attrs) do
    shoe
    |> cast(attrs, [:name, :variation, :buy_price, :sell_price, :source_id, :style_id, :filename])
    |> validate_required([:name, :variation, :buy_price, :sell_price, :source_id, :style_id, :filename])
  end
end
