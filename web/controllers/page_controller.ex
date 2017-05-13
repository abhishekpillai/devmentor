defmodule Devmentor.PageController do
  use Devmentor.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
