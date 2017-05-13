defmodule Devmentor.PageController do
  use Devmentor.Web, :controller

  def home(conn, _params) do
    render conn, "home.html"
  end

  def phoenix_home(conn, _params) do
    render conn, "phoenix_home.html"
  end
end
