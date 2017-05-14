defmodule Devmentor.PageController do
  use Devmentor.Web, :controller

  alias Devmentor.{Mentorship, Note}

  def home(conn, _params) do
    mship = Mentorship |> first |> Repo.one
    notes = Note.by_mentorship(mship.id)
    render conn, "home.html", notes: notes
  end

  def phoenix_home(conn, _params) do
    render conn, "phoenix_home.html"
  end
end
