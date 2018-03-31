defmodule Registering.PageControllerTest do
  use Registering.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Drivers Registration System!"
  end
end
