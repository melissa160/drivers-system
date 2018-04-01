defmodule Registering.TestHelpers do
  alias Registering.Repo

  def insert_driver(attrs \\ %{}) do
    changes = Map.merge(%{
      name: "test driver",
      identification: Base.encode16(:crypto.strong_rand_bytes(8))
    }, attrs)

    %Registering.Driver{}
    |> Registering.Driver.changeset(changes)
    |> Repo.insert!()
  end

  def insert_vehicle(driver, attrs \\ %{}) do
    driver
    |> Ecto.build_assoc(:vehicles, attrs)
    |> Repo.insert!()
  end
end
