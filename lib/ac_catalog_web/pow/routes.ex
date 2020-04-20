defmodule AcCatalogWeb.Pow.Routes do
  use AcCatalogWeb, :router
  use Pow.Phoenix.Routes
  alias AcCatalogWeb.Router.Helpers, as: Routes

  def after_sign_out_path(conn), do: NavigationHistory.last_path(conn)
  def after_sign_in_path(conn) do
    if Pow.Plug.current_user(conn),
      do: NavigationHistory.last_path(conn),
      else: Routes.pow_session_path(conn, :new)
  end
end
