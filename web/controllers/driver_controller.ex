defmodule Registering.DriverController do
  require IEx
  use Registering.Web, :controller

  alias Registering.Driver

  def index(conn, params) do
    render(conn, "index.html", drivers: search(params, Driver))
  end

  def search(%{"name" => _} = params, model) do
    Repo.all from d in model, where: ilike(d.name, ^"%#{params["name"]}%")
  end

  def search(%{"identification" => _} = params, model) do
    Repo.all from d in model, where: ilike(d.identification, ^"%#{params["identification"]}%")
  end

  def search(params, model) do
    Repo.all(model)
  end

  def new(conn, _params) do
    changeset = Driver.changeset(%Driver{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"driver" => driver_params}) do
    changeset = Driver.changeset(%Driver{}, driver_params)

    case Repo.insert(changeset) do
      {:ok, driver} ->
        conn
        |> put_flash(:info, "Driver created successfully.")
        |> redirect(to: driver_path(conn, :show, driver))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    driver = Repo.get!(Driver, id)
    render(conn, "show.html", driver: driver)
  end

  def edit(conn, %{"id" => id}) do
    driver = Repo.get!(Driver, id)
    changeset = Driver.changeset(driver)
    render(conn, "edit.html", driver: driver, changeset: changeset)
  end

  def update(conn, %{"id" => id, "driver" => driver_params}) do
    driver = Repo.get!(Driver, id)
    changeset = Driver.changeset(driver, driver_params)

    case Repo.update(changeset) do
      {:ok, driver} ->
        conn
        |> put_flash(:info, "Driver updated successfully.")
        |> redirect(to: driver_path(conn, :show, driver))
      {:error, changeset} ->
        render(conn, "edit.html", driver: driver, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    driver = Repo.get!(Driver, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(driver)

    conn
    |> put_flash(:info, "Driver deleted successfully.")
    |> redirect(to: driver_path(conn, :index))
  end
end
