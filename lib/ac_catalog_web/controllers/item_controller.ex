defmodule AcCatalogWeb.ItemController do
  use AcCatalogWeb, :controller

  plug :reload_user

  defp reload_user(conn, _opts) do
    config        = Pow.Plug.fetch_config(conn)

    case Pow.Plug.current_user(conn, config) do
      nil -> conn
      user ->
        reloaded_user = AcCatalog.Repo.get!(AcCatalog.Accounts.User, user.id)

        Pow.Plug.assign_current_user(conn, reloaded_user, config)
    end
  end

  def index(conn, _params) do
    current_user = Pow.Plug.current_user(conn)
    module = List.first(conn.path_info)
    headers = File.stream!("assets/static/data/#{AcCatalog.csv_name_from(module)}-Table 1.csv")
    |> CSV.decode!(headers: true)
    |> Enum.take(1)
    |> List.first

    render(conn, "index.html",
      user: current_user,
      has_variation: Map.has_key?(headers, "Variation"),
      has_buy_price: Map.has_key?(headers, "Buy"),
      has_sell_price: Map.has_key?(headers, "Sell"),
      has_source: Map.has_key?(headers, "Source")
    )
  end
end
