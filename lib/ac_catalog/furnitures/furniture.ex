defmodule AcCatalog.Furnitures.Furniture do
  use Ecto.Schema
  import Ecto.Changeset

  schema "furnitures" do
    field :buy_price, :integer
    field :category_id, :integer
    field :customization_cost, :integer
    field :name, :string
    field :sell_price, :integer
    field :size, :string
    field :source_id, :integer
    field :variation, :string

    timestamps()
  end

  @doc false
  def changeset(furniture, attrs) do
    furniture
    |> cast(attrs, [:name, :category_id, :buy_price, :sell_price, :source_id, :variation, :customization_cost, :size])
    |> validate_required([:name])
  end
end
