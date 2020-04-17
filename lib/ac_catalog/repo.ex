defmodule AcCatalog.Repo do
  use Ecto.Repo,
    otp_app: :ac_catalog,
    adapter: Ecto.Adapters.Postgres
end
