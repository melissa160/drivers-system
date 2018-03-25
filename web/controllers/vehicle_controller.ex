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

  def new(conn, _params) do
    changeset =
      conn.assigns.driver
      |> build_assoc(:vehicles)
      |> Vehicle.changeset()

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"vehicle" => vehicle_params}) do
    changeset =
      conn.assigns.driver
      |> build_assoc(:vehicles)
      |> Vehicle.changeset(vehicle_params)

    case Repo.insert(changeset) do
      {:ok, _vehicle} ->
        conn
        |> put_flash(:info, "Vehicle created successfully.")
        |> redirect(to: driver_vehicle_path(conn, :index, conn.assigns.driver))
      {:error, _vehicle} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
