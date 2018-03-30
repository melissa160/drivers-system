defmodule Registering.Helpers do

  alias Plug.Conn
  alias Registering.Repo
  import Ecto.Query

  def search(%{"name" => _} = params, model) do
    Repo.all from d in model, where: ilike(d.name, ^"%#{params["name"]}%")
  end

  def search(%{"identification" => _} = params, model) do
    Repo.all from d in model, where: ilike(d.identification, ^"%#{params["identification"]}%")
  end

  def search(%{"license_plate" => _} = params, model) do
    Repo.all from d in model, where: ilike(d.license_plate, ^"%#{params["license_plate"]}%")
  end

  def search(params, model) do
    Repo.all(model)
  end

end
