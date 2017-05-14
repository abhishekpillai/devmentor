defmodule Devmentor.PageController do
  use Devmentor.Web, :controller

  alias Devmentor.Mentorship

  def home(conn, _params) do
    mship = Mentorship.by_id(1)
    render conn, "home.html", notes: mship.notes
  end

  def phoenix_home(conn, _params) do
    render conn, "phoenix_home.html"
  end
end
