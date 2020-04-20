defmodule AcCatalog.Headwears.Headwear do
  use Ecto.Schema
  import Ecto.Changeset

  schema "headwears" do
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
  def changeset(headwear, attrs) do
    headwear
    |> cast(attrs, [:name, :variation, :buy_price, :sell_price, :source_id, :style_id, :filename])
    |> validate_required([:name, :variation, :buy_price, :sell_price, :source_id, :style_id, :filename])
  end
end
