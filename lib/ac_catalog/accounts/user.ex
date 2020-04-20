defmodule AcCatalog.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  use Pow.Ecto.Schema

  schema "users" do
    pow_user_fields()

    field :owned_accessories_ids, {:array, :integer}
    field :owned_bags_ids, {:array, :integer}
    field :owned_bottoms_ids, {:array, :integer}
    field :owned_dresses_ids, {:array, :integer}
    field :owned_headwears_ids, {:array, :integer}
    field :owned_shoes_ids, {:array, :integer}
    field :owned_socks_ids, {:array, :integer}
    field :owned_tops_ids, {:array, :integer}
    field :owned_umbrellas_ids, {:array, :integer}

    timestamps()
  end

  def changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> cast(attrs, [:owned_accessories_ids, :owned_bags_ids, :owned_bottoms_ids,
      :owned_dresses_ids, :owned_headwears_ids, :owned_shoes_ids, :owned_socks_ids, :owned_tops_ids, :owned_umbrellas_ids])
  end
end
