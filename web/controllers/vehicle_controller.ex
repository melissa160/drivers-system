defmodule Registering.VehicleController do
  use Registering.Web, :controller

  alias Registering.Vehicle

  plug :find_user
  plug :action

  defp find_user(conn, _) do
    driver = Repo.get(Registering.Driver, conn.params["driver_id"])
    assign(conn, :driver, driver)
  end

  def index(conn, _params) do
    driver = conn.assigns.driver
    vehicles = Repo.all assoc(driver, :vehicles)

    render conn, vehicles: vehicles, driver: driver
  end
end
