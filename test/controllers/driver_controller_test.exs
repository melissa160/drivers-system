defmodule Registering.DriverControllerTest do
  use Registering.ConnCase

  alias Registering.Driver
  @valid_attrs %{identification: "some identification", name: "some name"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, driver_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing drivers"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, driver_path(conn, :new)
    assert html_response(conn, 200) =~ "New driver"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, driver_path(conn, :create), driver: @valid_attrs
    driver = Repo.get_by!(Driver, @valid_attrs)
    assert redirected_to(conn) == driver_path(conn, :show, driver.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, driver_path(conn, :create), driver: @invalid_attrs
    assert html_response(conn, 200) =~ "New driver"
  end

  test "shows chosen resource", %{conn: conn} do
    driver = Repo.insert! %Driver{}
    conn = get conn, driver_path(conn, :show, driver)
    assert html_response(conn, 200) =~ "Show driver"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, driver_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    driver = Repo.insert! %Driver{}
    conn = get conn, driver_path(conn, :edit, driver)
    assert html_response(conn, 200) =~ "Edit driver"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    driver = Repo.insert! %Driver{}
    conn = put conn, driver_path(conn, :update, driver), driver: @valid_attrs
    assert redirected_to(conn) == driver_path(conn, :show, driver)
    assert Repo.get_by(Driver, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    driver = Repo.insert! %Driver{}
    conn = put conn, driver_path(conn, :update, driver), driver: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit driver"
  end

  test "deletes chosen resource", %{conn: conn} do
    driver = Repo.insert! %Driver{}
    conn = delete conn, driver_path(conn, :delete, driver)
    assert redirected_to(conn) == driver_path(conn, :index)
    refute Repo.get(Driver, driver.id)
  end
end
