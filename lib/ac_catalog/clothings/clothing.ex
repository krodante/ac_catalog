defmodule AcCatalog.Clothings.Clothing do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clothings" do
    field :buy_price, :integer
    field :filename, :string
    field :name, :string
    field :sell_price, :integer
    field :source_id, :integer
    field :variation, :string

    timestamps()
  end

  @doc false
  def changeset(clothing, attrs) do
    clothing
    |> cast(attrs, [:name, :buy_price, :sell_price, :source_id, :variation, :filename])
    |> validate_required([:name, :buy_price, :sell_price, :source_id, :variation, :filename])
  end
end
