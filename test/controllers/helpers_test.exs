defmodule Registering.HelpersTest do
  use Registering.ConnCase

  setup do
    driver = insert_driver(%{name: "pepito", identification: "1357"})
    conn = assign(build_conn(),:driver, driver)
    {:ok, conn: conn, driver: driver}
  end

  test "when optional params are not present in drivers path", %{conn: conn, driver: driver} do
    conn = get conn, driver_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing drivers"
    assert String.contains?(conn.resp_body, driver.name)
  end

  test "when name optional param is present in drivers path",%{driver: driver} do
    driver2 = insert_driver(%{name: "maria", identification: "5990"})
    driver3 = insert_driver(%{name: "martha", identification: "3119"})
    conn = get build_conn(), "/drivers?name=mar"
    assert conn.status == 200
    refute String.contains?(conn.resp_body, driver.name)
    assert String.contains?(conn.resp_body, driver2.name)
    assert String.contains?(conn.resp_body, driver3.name)
  end

  test "when identification optional param is present in drivers path",%{driver: driver} do
    driver2 = insert_driver(%{name: "maria", identification: "5990"})
    driver3 = insert_driver(%{name: "timoteo", identification: "1352"})
    conn = get build_conn(), "/drivers?identification=135"
    assert conn.status == 200
    assert String.contains?(conn.resp_body, driver.name)
    refute String.contains?(conn.resp_body, driver2.name)
    assert String.contains?(conn.resp_body, driver3.name)
  end

  test "when license_plate optional param is present in vehicles path"  do
    driver2 = insert_driver(%{name: "maria", identification: "5990"})
    vehicle2 = insert_vehicle(driver2, license_plate: "AXE357")
    driver3 = insert_driver(%{name: "timoteo", identification: "1352"})
    vehicle3 = insert_vehicle(driver3, license_plate: "HOL157")
    conn = get build_conn(), "/vehicles?license_plate=HOL"
    assert conn.status == 200
    refute String.contains?(conn.resp_body, vehicle2.license_plate)
    assert String.contains?(conn.resp_body, vehicle3.license_plate)
  end

end
