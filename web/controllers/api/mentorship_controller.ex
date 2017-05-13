defmodule Devmentor.Api.MentorshipController do
  use Devmentor.Web, :controller

  alias Devmentor.Mentorship

  def notes(conn, %{"id" => id}) do
    mship = Repo.get(Mentorship, id)
      |> Repo.preload([notes: :user])
    case mship do
      nil ->
        conn
        |> put_status(404)
        |> json %{}
      %{ notes: notes } ->
        json conn, %{ data: Enum.map(notes, &note_json(&1)) }
    end
  end

  defp note_json(note) do
    %{
      body: note.body,
      user: %{
        name: note.user.name
      }
    }
  end
end
