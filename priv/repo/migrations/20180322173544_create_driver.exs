defmodule Registering.Repo.Migrations.CreateDriver do
  use Ecto.Migration

  def change do
    create table(:drivers) do
      add :name, :string
      add :identification, :string

      timestamps()
    end
  end
end
