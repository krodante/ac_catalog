defmodule AcCatalog.Accounts.User do
  use Ecto.Schema
  use Pow.Ecto.Schema
  use Pow.Extension.Ecto.Schema,
    extensions: [PowResetPassword, PowEmailConfirmation]

  import Ecto.Changeset

  schema "users" do
    pow_user_fields()

    field :accessories_ids, {:array, :string}
    field :bags_ids, {:array, :string}
    field :bottoms_ids, {:array, :string}
    field :dresses_ids, {:array, :string}
    field :headwear_ids, {:array, :string}
    field :shoes_ids, {:array, :string}
    field :socks_ids, {:array, :string}
    field :tops_ids, {:array, :string}
    field :umbrellas_ids, {:array, :string}

    field :floors_ids, {:array, :string}
    field :housewares_ids, {:array, :string}
    field :miscellaneous_ids, {:array, :string}
    field :music_ids, {:array, :string}
    field :rugs_ids, {:array, :string}
    field :wall_mounted_ids, {:array, :string}
    field :wallpapers_ids, {:array, :string}

    field :achievements_ids, {:array, :string}
    field :art_ids, {:array, :string}
    field :construction_ids, {:array, :string}
    field :fencing_ids, {:array, :string}
    field :fish_ids, {:array, :string}
    field :fossils_mounteds_ids, {:array, :string}
    field :nook_miles_ids, {:array, :string}
    field :photos_ids, {:array, :string}
    field :posters_ids, {:array, :string}
    field :recipes_ids, {:array, :string}
    field :tools_ids, {:array, :string}

    timestamps()
  end

  def item_changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> cast(attrs, [
      :accessories_ids, :bags_ids, :bottoms_ids, :dresses_ids, :headwear_ids, :shoes_ids, :socks_ids, :tops_ids, :umbrellas_ids,
      :floors_ids, :housewares_ids, :miscellaneous_ids, :music_ids, :rugs_ids, :wall_mounted_ids, :wallpapers_ids,
      :achievements_ids, :art_ids, :construction_ids, :fencing_ids, :fish_ids, :fossils_mounteds_ids, :nook_miles_ids, :photos_ids, :posters_ids, :recipes_ids, :tools_ids
    ])
  end

  def changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> pow_changeset(attrs)
    |> pow_extension_changeset(attrs)
  end
end
