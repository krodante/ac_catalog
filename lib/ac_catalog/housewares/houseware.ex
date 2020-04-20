defmodule AcCatalog.Housewares.Houseware do
  use Ecto.Schema
  import Ecto.Changeset

  schema "housewares" do
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
  def changeset(houseware, attrs) do
    houseware
    |> cast(attrs, [:name, :variation, :buy_price, :sell_price, :size, :source_id, :filename])
    |> validate_required([:name, :variation, :buy_price, :sell_price, :size, :source_id, :filename])
  end
end
