defmodule Devmentor.Api.NoteControllerTest do
  use Devmentor.ConnCase

  alias Devmentor.{Repo, Mentorship, User}

  describe "create/2" do
    test "returns 201 and created note" do
      user_abhi = Repo.insert! %User{ name: "abhi" }
      user_neely = Repo.insert! %User{ name: "neely" }

      mship =
        %Mentorship{ mentor_id: user_abhi.id, mentee_id: user_neely.id }
        |> Repo.insert!()

      conn = post build_conn(), api_note_path(build_conn(), :create), note: %{
        body: "some content",
        mentorship_id: mship.id,
        user_id: user_abhi.id
      }

      assert json_response(conn, 201) == %{
        "data" => %{
          "body" => "some content",
          "user" => %{ "name" => "abhi" }
        }
      }
    end

    test "returns 400 if not provided valid data" do
      user_abhi = Repo.insert! %User{ name: "abhi" }
      user_neely = Repo.insert! %User{ name: "neely" }

      _mship =
        %Mentorship{ mentor_id: user_abhi.id, mentee_id: user_neely.id }
        |> Repo.insert!()

      conn = post build_conn(), api_note_path(build_conn(), :create), note: %{
        body: "some content",
        user_id: user_abhi.id
      }

      assert json_response(conn, 400) == %{ "data" => nil }
    end
  end
end
