defmodule Devmentor.Api.NoteController do
  use Devmentor.Web, :controller

  alias Devmentor.{Note, Repo}

  def create(conn, %{"note" => note_params}) do
    changeset = Note.changeset(%Note{}, note_params)

    case Repo.insert(changeset) do
      {:ok, note} ->
        note = Repo.preload(note, [:user])
        conn
        |> put_status(201)
        |> json(%{"data" => note_json(note)})
      {:error, changeset} -> :error
        conn
        |> put_status(400)
        |> json(%{"data" => nil})
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
