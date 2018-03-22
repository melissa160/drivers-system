defmodule Registering.VehicleTest do
  use Registering.ModelCase

  alias Registering.Vehicle

  @valid_attrs %{brand: "some brand", kind: "some kind", license_plate: "some license_plate"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Vehicle.changeset(%Vehicle{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Vehicle.changeset(%Vehicle{}, @invalid_attrs)
    refute changeset.valid?
  end
end
