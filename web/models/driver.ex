defmodule Registering.Driver do
  use Registering.Web, :model

  schema "drivers" do
    has_many :vehicles, Registering.Vehicle
    field :name, :string
    field :identification, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :identification])
    |> validate_required([:name, :identification])
  end
end
