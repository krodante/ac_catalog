defmodule AcCatalogWeb.PageController do
  use AcCatalogWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
