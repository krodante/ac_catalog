defmodule AcCatalog.Bags.Bag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bags" do
    field :buy_price, :integer
    field :filename, :string
    field :name, :string
    field :sell_price, :integer
    field :source_id, :integer
    field :style_id, :integer

    timestamps()
  end

  @doc false
  def changeset(bag, attrs) do
    bag
    |> cast(attrs, [:name, :buy_price, :sell_price, :source_id, :style_id, :filename])
    |> validate_required([:name, :buy_price, :sell_price, :source_id, :style_id, :filename])
  end
end
