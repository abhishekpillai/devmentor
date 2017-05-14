defmodule Devmentor.PageController do
  use Devmentor.Web, :controller

  alias Devmentor.Mentorship

  def home(conn, _params) do
    mship = Repo.get(Mentorship, 1) # hardcode to 1st
      |> Repo.preload([notes: :user])
    render conn, "home.html", notes: mship.notes
  end

  def phoenix_home(conn, _params) do
    render conn, "phoenix_home.html"
  end
end
