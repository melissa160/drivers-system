defmodule Registering.DriverTest do
  use Registering.ModelCase

  alias Registering.Driver

  @valid_attrs %{identification: "some identification", name: "some name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Driver.changeset(%Driver{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Driver.changeset(%Driver{}, @invalid_attrs)
    refute changeset.valid?
  end
end
