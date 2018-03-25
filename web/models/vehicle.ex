defmodule Registering.Vehicle do
  use Registering.Web, :model

  schema "vehicles" do
    belongs_to :driver, Registering.Driver
    field :license_plate, :string
    field :brand, :string
    field :kind, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:license_plate, :brand, :kind])
    |> validate_required([:license_plate, :brand, :kind])
  end
end
