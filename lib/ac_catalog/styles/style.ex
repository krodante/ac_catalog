defmodule AcCatalog.Styles.Style do
  use Ecto.Schema
  import Ecto.Changeset

  schema "styles" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(style, attrs) do
    style
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
