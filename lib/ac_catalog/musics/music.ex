defmodule AcCatalog.Musics.Music do
  use Ecto.Schema
  import Ecto.Changeset

  schema "musics" do
    field :buy_price, :integer
    field :filename, :string
    field :name, :string
    field :sell_price, :integer
    field :source_id, :integer

    timestamps()
  end

  @doc false
  def changeset(music, attrs) do
    music
    |> cast(attrs, [:name, :buy_price, :sell_price, :source_id, :filename])
    |> validate_required([:name, :buy_price, :sell_price, :source_id, :filename])
  end
end
