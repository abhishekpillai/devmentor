defmodule Devmentor.PageController do
  use Devmentor.Web, :controller

  alias Devmentor.{Mentorship, Note}

  def home(conn, %{"id" => id}) do
    mship = Mentorship.by_id(id)
    render_mentorship_home(conn, mship)
  end
  def home(conn, _params) do
    mship =
      Mentorship
      |> first
      |> Repo.one
      |> Repo.preload([:mentor, :mentee])
    render_mentorship_home(conn, mship)
  end

  def phoenix_home(conn, _params) do
    render conn, "phoenix_home.html"
  end


  defp render_mentorship_home(conn, mship) do
    notes = Note.by_mentorship(mship.id)
    render conn, "home.html",
      notes: notes,
      mentor: mship.mentor,
      mentee: mship.mentee
  end
end
