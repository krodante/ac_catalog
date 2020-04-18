defmodule AcCatalogWeb.FurnitureLive.Index do
  use Phoenix.LiveView
  alias AcCatalog.Furnitures
  alias AcCatalogWeb.FurnitureView

  def render(assigns) do
    FurnitureView.render("index.html", assigns)
  end

  def mount(_params, _session, socket) do
    Furnitures.subscribe()

    {:ok, fetch(socket)}
  end

  def handle_event("add", %{"furniture" => furniture}, socket) do
    Furnitures.create_furniture(furniture)

    {:noreply, fetch(socket)}
  end

  def handle_info({Furnitures, [:furniture | _], _}, socket) do
    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, furnitures: Furnitures.list_furnitures())
  end
end
