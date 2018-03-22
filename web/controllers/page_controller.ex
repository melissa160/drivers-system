defmodule Registering.PageController do
  use Registering.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
