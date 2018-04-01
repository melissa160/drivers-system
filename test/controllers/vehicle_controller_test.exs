defmodule Registering.VehicleControllerTest do
  use Registering.ConnCase

  @valid_attrs %{license_plate: "ABC135", kind: "Van", brand: "Nissan"}
  @invalid_attrs %{license_plate: "EOJ319"}

  setup do
    driver = insert_driver(%{name: "pepito"})
    conn = assign(build_conn(),:driver, driver)
    {:ok, conn: conn, driver: driver}
  end

  test "list all vehicules with list action", %{conn: conn} do
    conn = get conn, vehicle_path(conn, :list)
    assert html_response(conn, 200) =~ "Listing vehicles"
  end

  test "list all vehicules for an user with index action", %{conn: conn, driver: driver} do
    driver_vehicle = insert_vehicle(driver, license_plate: "AXE357")
    conn = get conn, driver_vehicle_path(conn, :index, driver)
    assert html_response(conn, 200) =~ "Listing vehicles for pepito"
    assert String.contains?(conn.resp_body, driver_vehicle.license_plate)
  end

  test "renders form for new vehicle", %{conn: conn, driver: driver} do
    conn = get conn, driver_vehicle_path(conn, :new, driver)
    assert html_response(conn, 200) =~ "New vehicle"
  end

  test "creates vehicle and redirects when data is valid", %{conn: conn, driver: driver} do
    conn = post conn, driver_vehicle_path(conn, :create, driver), vehicle: @valid_attrs
    assert redirected_to(conn) == driver_vehicle_path(conn, :index, driver.id)
  end

  test "does not create vehicle and renders errors when data is invalid", %{conn: conn, driver: driver} do
    conn = post conn, driver_vehicle_path(conn, :create, driver), vehicle: @invalid_attrs
    assert html_response(conn, 200) =~ "New vehicle"
  end

end
