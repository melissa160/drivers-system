defmodule Registering.Repo.Migrations.CreateVehicle do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :driver_id, references(:drivers)
      add :license_plate, :string
      add :brand, :string
      add :kind, :string

      timestamps()
    end
  end
end
