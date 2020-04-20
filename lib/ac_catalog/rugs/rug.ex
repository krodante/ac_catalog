defmodule AcCatalog.Rugs.Rug do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rugs" do
    field :buy_price, :integer
    field :filename, :string
    field :name, :string
    field :sell_price, :integer
    field :size, :string
    field :source_id, :integer

    timestamps()
  end

  @doc false
  def changeset(rug, attrs) do
    rug
    |> cast(attrs, [:name, :buy_price, :sell_price, :size, :source_id, :filename])
    |> validate_required([:name, :buy_price, :sell_price, :size, :source_id, :filename])
  end
end
